import 'dart:convert';

import 'package:ab_shared/components/ab_toast.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/services/revenue_cat_service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Allow getIt elements to be reassigned
  getIt.allowReassignment = true;
  if (!getIt.isRegistered<ABToastController>()) {
    getIt.registerSingleton<ABToastController>(ABToastController());
  }
  if (!getIt.isRegistered<SideMenuController>()) {
    getIt.registerSingleton<SideMenuController>(SideMenuController());
  }
  if (!getIt.isRegistered<GlobalKey<NavigatorState>>(
      instanceName: 'rootNavigatorKey')) {
    getIt.registerSingleton<GlobalKey<NavigatorState>>(
        GlobalKey<NavigatorState>(),
        instanceName: 'rootNavigatorKey');
  }

  if (!getIt.isRegistered<EnvModel>()) {
    getIt.registerSingletonAsync<EnvModel>(() async => await EnvModel.create());
  }
  if (!getIt.isRegistered<SharedPreferences>()) {
    getIt.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }
  if (!getIt.isRegistered<ApiClient>()) {
    getIt.registerSingletonWithDependencies<ApiClient>(
      () => ApiClient().init(),
      dependsOn: [EnvModel, SharedPreferences],
    );
  }

  if (!getIt.isRegistered<Map<String, dynamic>>(instanceName: 'userData')) {
    getIt.registerSingletonWithDependencies<Map<String, dynamic>>(
      () {
        final rawUserData = getIt<SharedPreferences>().getString("user");
        return rawUserData != null ? json.decode(rawUserData) : {};
      },
      dependsOn: [SharedPreferences],
      instanceName: 'userData',
    );
  }
  if (!getIt.isRegistered<String>(instanceName: 'userKey')) {
    getIt.registerSingletonWithDependencies<String>(
      () {
        final userKey = getIt<SharedPreferences>().getString("key");
        return userKey ?? "";
      },
      dependsOn: [SharedPreferences],
      instanceName: 'userKey',
    );
  }
  if (!getIt.isRegistered<String>(instanceName: 'agePublicKey')) {
    getIt.registerSingletonWithDependencies<String>(
      () {
        final agePublicKey =
            getIt<SharedPreferences>().getString("agePublicKey");
        return agePublicKey ?? "";
      },
      dependsOn: [SharedPreferences],
      instanceName: 'agePublicKey',
    );
  }
  if (!getIt.isRegistered<EncryptionService>()) {
    getIt.registerSingletonWithDependencies<EncryptionService>(
      () {
        return EncryptionService(
          userSalt: getIt<SharedPreferences>().getString("userSalt") ?? "",
          userKey: getIt<SharedPreferences>().getString("key"),
          agePublicKey: getIt<SharedPreferences>().getString("agePublicKey"),
        );
      },
      dependsOn: [SharedPreferences],
    );
  }

  if (!getIt.isRegistered<RevenueCatService>()) {
    getIt.registerSingletonWithDependencies<RevenueCatService>(
      () {
        return RevenueCatService(
          googleRevenueCatApiKey: getIt<EnvModel>().googleRevenueCatApiKey,
          appleRevenueCatApiKey: getIt<EnvModel>().appleRevenueCatApiKey,
        );
      },
      dependsOn: [EnvModel],
    );
  }
}
