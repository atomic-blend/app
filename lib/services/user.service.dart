import 'dart:convert';

import 'package:app/entities/user/user.entity.dart';
import 'package:app/entities/userRole/userRole.entity.dart';
import 'package:app/entities/user_device/user_device.dart';
import 'package:app/entities/purchase/purchase.dart';
import 'package:app/main.dart';
import 'package:app/services/device_info.service.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/services/revenue_cat_service.dart';
import 'package:app/utils/api_client.dart';
import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

EncryptionService? encryptionService;
DeviceInfoService? deviceInfoService;

class UserService {
  UserService();

  Future<void> logOut() async {
    userKey = null;
    userData = null;
    await prefs?.clear();
    globalApiClient.setIdToken(null);
    Sentry.configureScope(
      (scope) => scope.setUser(SentryUser(id: null)),
    );
    await RevenueCatService.logOut();
    encryptionService = null;
    deviceInfoService = null;
  }

  Future<UserEntity> createUser(UserEntity user) async {
    globalApiClient.setIdToken(user.accessToken!);
    final result = await globalApiClient.post('/user/setup', data: user);
    if (result.statusCode == 201) {
      user.id = result.data['_id'];
      user.roles = result.data['roles'].map<UserRoleEntity>((role) {
        role['id'] = role['_id'];
        return UserRoleEntity.fromJson(role);
      }).toList() as List<UserRoleEntity>;

      prefs?.setString('user', json.encode(user.toJson()));
      Sentry.configureScope(
        (scope) => scope.setUser(SentryUser(id: '${user.id}')),
      );
      return user;
    } else {
      throw Exception('user_creation_failed');
    }
  }

  Future<UserEntity> updateUserDevice(
      UserEntity user, UserDeviceEntity device) async {
    final result = await globalApiClient.put('/users/device', data: device);
    if (result.statusCode == 200) {
      final user = UserEntity.fromJson(result.data["data"]);
      prefs?.setString('user', json.encode(user.toJson()));
      return user;
    } else {
      throw Exception('user_device_update_failed');
    }
  }

  Future<UserEntity?> getUser(UserEntity user) async {
    try {
      var result = await globalApiClient.get('/users/profile');
      if (result.statusCode == 200) {
        final newUser = UserEntity.fromJson(result.data["data"]);
        await prefs?.setString('user', json.encode(newUser.toJson()));
        return newUser;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<UserEntity?> checkForLoggedInUser() async {
    final userRaw = prefs?.getString('accessToken');
    if (userRaw != null) {
      final user = json.decode(userRaw);
      if (user != null) {
        return UserEntity.fromJson(user);
      } else {
        return null;
      }
    }
    return null;
  }

  Future<bool> deleteUser() async {
    var result = await globalApiClient.delete('/users/me');
    if (result.statusCode == 200) {
      logOut();
      return true;
    } else {
      return false;
    }
  }

  Future<UserEntity?> login(String email, String password) async {
    final result = await globalApiClient.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    if (result.statusCode == 200) {
      final userData = result.data['user'];
      final user = UserEntity.fromJson(userData);
      await RevenueCatService.logIn(user.id!);
      await prefs?.setString('user', json.encode(user.toJson()));
      await prefs?.setString('accessToken', result.data["accessToken"]);
      await prefs?.setString('refreshToken', result.data["refreshToken"]);

      globalApiClient.setIdToken(result.data["accessToken"]);

      // restore data key from password
      encryptionService ??= EncryptionService(userSalt: user.keySet.salt);
      await encryptionService?.restoreDataKey(password, user.keySet);

      Sentry.configureScope(
        (scope) => scope.setUser(SentryUser(id: '${user.id}')),
      );

      return user;
    } else if (result.statusCode == 401) {
      throw Exception("wrong_email_password");
    } else {
      throw Exception('login_failed');
    }
  }

  Future<UserEntity?> register(String email, String password) async {
    // derive and persist key from password
    final keySet = await EncryptionService.generateKeySet(password);

    final result = await globalApiClient.post('/auth/register', data: {
      'email': email,
      'password': password,
      'keySet': keySet?.toJson(),
    });
    if (result.statusCode == 201) {
      userData = result.data['user'];
      userData!['accessToken'] = result.data['accessToken'];
      userData!['refreshToken'] = result.data['refreshToken'];
      final user = UserEntity.fromJson(userData!);
      await RevenueCatService.logIn(user.id!);
      prefs?.setString('user', json.encode(user.toJson()));
      user.keySet = keySet!;

      globalApiClient.setIdToken(user.accessToken!);

      Sentry.configureScope(
        (scope) => scope.setUser(SentryUser(id: '${user.id}')),
      );

      return user;
    } else {
      throw Exception('registration_failed');
    }
  }

  static Future<String?> refreshToken(UserEntity user) async {
    final refreshToken = user.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception('No refresh token available');
    }
    final apiClient = Dio();
    apiClient.options = BaseOptions(
      baseUrl: env!.restApiUrl,
      headers: {
        'Authorization': 'Bearer $refreshToken',
      },
    );
    final result = await apiClient.post('/auth/refresh');
    if (result.statusCode != 200) {
      throw Exception('Token refresh failed');
    }
    final accessToken = result.data['accessToken'];
    user.accessToken = accessToken;
    user.refreshToken = result.data['refreshToken'];
    prefs?.setString('user', json.encode(user.toJson()));
    globalApiClient.setIdToken(accessToken);

    return accessToken;
  }

  updateUserProfile(String userId, UserEntity userPayload) async {
    final result =
        await globalApiClient.put('/users/profile', data: userPayload);
    if (result.statusCode == 200) {
      final user = UserEntity.fromJson(result.data["data"]);
      prefs?.setString('user', json.encode(user.toJson()));
      return user;
    } else {
      throw Exception('user_update_failed');
    }
  }

  changePassword({
    required String oldPassword,
    required String newPassword,
    required String newEncryptedDataKey,
    required String newUserKey,
    required String newUserSalt,
  }) async {
    final result = await globalApiClient.put('/users/password', data: {
      'old_password': oldPassword,
      'new_password': newPassword,
      'user_key': newEncryptedDataKey,
      'salt': newUserSalt,
    });
    if (result.statusCode == 200) {
      await EncryptionService.persistNewUserKey(base64.decode(newUserKey));
      return true;
    } else {
      throw Exception('password_change_failed');
    }
  }

  Future<bool> startResetPassword(String email) async {
    final result = await globalApiClient.post('/auth/reset-password', data: {
      'email': email,
    });
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('reset_password_failed');
    }
  }

  Future<bool> confirmResetPassword({
    required String resetCode,
    required bool resetData,
    required String newPassword,
    required String userKey,
    required String userSalt,
    required String backupKey,
    required String backupSalt,
  }) async {
    final result =
        await globalApiClient.post('/auth/reset-password/confirm', data: {
      'reset_code': resetCode,
      'reset_data': resetData,
      'new_password': newPassword,
      'user_key': userKey,
      'user_salt': userSalt,
      'backup_key': backupKey,
      'backup_salt': backupSalt,
    });
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('reset_password_failed');
    }
  }

  Future<Map<String, dynamic>> getBackupKeyForPasswordReset(
      String resetCode) async {
    final result =
        await globalApiClient.post('/auth/reset-password/backup-key', data: {
      'reset_code': resetCode,
    });
    if (result.statusCode == 200) {
      return result.data;
    } else {
      throw Exception('reset_password_failed');
    }
  }

  //check if user have an active subscription in purchases
  static bool isSubscriptionActive(UserEntity? user) {
    if (ApiClient.getSelfHostedRestApiUrl() != null &&
        ApiClient.getSelfHostedRestApiUrl() != env?.restApiUrl) {
      // Self-hosted instance, no subscription logic
      return true;
    }
    if (user?.purchases == null || user!.purchases!.isEmpty) {
      return false;
    }

    final nowMs = DateTime.now().millisecondsSinceEpoch;

    for (final purchase in user.purchases!) {
      // Check if it's a RevenueCat purchase
      if (purchase.type == PurchaseType.revenueCat) {
        final purchaseData = purchase.purchaseData;

        // Check for expiration timestamp in milliseconds
        if (purchaseData.containsKey('expiration_at_ms') &&
            purchaseData['expiration_at_ms'] != null) {
          try {
            final expirationAtMs = purchaseData['expiration_at_ms'];
            // Handle both int and string representations
            final int expirationTimestamp = expirationAtMs is int
                ? expirationAtMs
                : int.parse(expirationAtMs.toString());

            if (expirationTimestamp > nowMs) {
              return true; // Found an active subscription
            }
          } catch (e) {
            // Invalid timestamp format, skip this purchase
            continue;
          }
        }

        // Additional check: ensure it's a subscription type
        if (purchaseData.containsKey('type') &&
            purchaseData['type'] == 'SUBSCRIPTION') {
          // For subscriptions without expiration data, check purchase date
          if (purchaseData.containsKey('purchased_at_ms')) {
            try {
              final purchasedAtMs = purchaseData['purchased_at_ms'];
              final int purchaseTimestamp = purchasedAtMs is int
                  ? purchasedAtMs
                  : int.parse(purchasedAtMs.toString());

              // Consider it active if purchased recently (within last 30 days)
              // This is a fallback - ideally expiration_at_ms should always be present
              final thirtyDaysAgo = nowMs - (30 * 24 * 60 * 60 * 1000);
              if (purchaseTimestamp > thirtyDaysAgo) {
                return true;
              }
            } catch (e) {
              // Invalid timestamp, skip
              continue;
            }
          }
        }
      }
    }
    return false; // No active subscription found
  }

  static Purchase getCurrentSubscription(UserEntity? user) {
    if (user == null || user.purchases == null || user.purchases!.isEmpty) {
      throw Exception('No active subscription found');
    }

    final nowMs = DateTime.now().millisecondsSinceEpoch;

    for (final purchase in user.purchases!) {
      if (purchase.type == PurchaseType.revenueCat) {
        final purchaseData = purchase.purchaseData;

        // Check for expiration timestamp in milliseconds
        if (purchaseData.containsKey('expiration_at_ms') &&
            purchaseData['expiration_at_ms'] != null) {
          try {
            final expirationAtMs = purchaseData['expiration_at_ms'];
            final int expirationTimestamp = expirationAtMs is int
                ? expirationAtMs
                : int.parse(expirationAtMs.toString());

            if (expirationTimestamp > nowMs) {
              return purchase; // Found an active subscription
            }
          } catch (e) {
            // Invalid timestamp format, skip this purchase
            continue;
          }
        }
      }
    }
    throw Exception('No active subscription found');
  }

  static DateTime getNextBillingDate(Purchase purchase) {
    if (purchase.type != PurchaseType.revenueCat) {
      throw Exception('Purchase is not a RevenueCat subscription');
    }

    final purchaseData = purchase.purchaseData;

    final expirationAtMs = purchaseData['expiration_at_ms'];
    if (expirationAtMs == null) {
      throw Exception('Expiration at timestamp not found in purchase data');
    }
    final int expirationTimestamp = expirationAtMs is int
        ? expirationAtMs
        : int.parse(expirationAtMs.toString());
    final expirationDate =
        DateTime.fromMillisecondsSinceEpoch(expirationTimestamp);
    return expirationDate;
  }
}
