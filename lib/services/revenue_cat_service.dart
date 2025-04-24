import 'dart:io' show Platform;

import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class RevenueCatService {
  static Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration? configuration;
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration("revenuecat_project_google_api_key");
      // if (buildingForAmazon) {
      //   // use your preferred way to determine if this build is for Amazon store
      //   // checkout our MagicWeather sample for a suggestion
      //   configuration = AmazonConfiguration("");
      // }
    } else if (Platform.isIOS) {
      configuration = PurchasesConfiguration("");
    } else {
      throw Exception("Unsupported platform");
    }
    await Purchases.configure(configuration);
  }

  static Future<bool> logIn(String userId) async {
    try {
      await Purchases.logIn(userId);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<PaywallResult> showPaywall() async {
    return await RevenueCatUI.presentPaywall();
  }
}