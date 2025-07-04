import 'dart:io' show Platform;

import 'package:app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatService {
  static Future<void> initPlatformState() async {
    try {
      if (kDebugMode) {
        print('RevenueCat: Starting initialization...');
      }

      await Purchases.setLogLevel(LogLevel.debug);

      PurchasesConfiguration? configuration;
      if (Platform.isAndroid) {
        if (kDebugMode) {
          print(
              'RevenueCat: Configuring for Android with key: ${env!.googleRevenueCatApiKey.isNotEmpty ? 'PROVIDED' : 'EMPTY'}');
        }
        configuration = PurchasesConfiguration(env!.googleRevenueCatApiKey);
        // if (buildingForAmazon) {
        //   // use your preferred way to determine if this build is for Amazon store
        //   // checkout our MagicWeather sample for a suggestion
        //   configuration = AmazonConfiguration("");
        // }
      } else if (Platform.isIOS) {
        if (kDebugMode) {
          print(
              'RevenueCat: Configuring for iOS with key: ${env!.appleRevenueCatApiKey.isNotEmpty ? 'PROVIDED' : 'EMPTY'}');
        }
        configuration = PurchasesConfiguration(env!.appleRevenueCatApiKey);
      } else {
        throw Exception("Unsupported platform");
      }

      await Purchases.configure(configuration);
      if (kDebugMode) {
        print('RevenueCat: Initialization completed successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('RevenueCat: Initialization failed with error: $e');
      }
      rethrow;
    }
  }

  static Future<bool> logIn(String userId) async {
    try {
      await Purchases.logIn(userId);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> logOut() async {
    try {
      await Purchases.logOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Offerings?> getOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      return offerings;
    } catch (e) {
      if (kDebugMode) {
        print('RevenueCat getOfferings error: $e');
      }
      return null;
    }
  }

  static Future<CustomerInfo?> makePurchase({
    required Package package,
  }) async {
    try {
      final purchaseResult = await Purchases.purchasePackage(package);
      return purchaseResult;
    } catch (e) {
      // Handle purchase error
      // final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (kDebugMode) {
        print('RevenueCat purchase error: $e');
      }
      return null;
    }
  }

  static Future<String?> getManagementUrl() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      if (customerInfo.entitlements.active.isNotEmpty) {
        return customerInfo.managementURL;
      } else {
        return null; // No active entitlements
      }
    } catch (e) {
      return null; // Handle error
    }
  }
}
