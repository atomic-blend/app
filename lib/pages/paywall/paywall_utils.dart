import 'package:app/entities/user/user.entity.dart';
import 'package:app/main.dart';
import 'package:app/pages/paywall/paywall.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/api_client.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaywallUtils {
  static resetPaywall() {
    prefs?.remove("paywall_displayed");
  }

  static showPaywall(BuildContext context, {UserEntity? user}) async {
    if (ApiClient.getSelfHostedRestApiUrl() != null) {
      return;
    }
    final paywallDisplayed = prefs?.getBool("paywall_displayed") ?? false;
    if (paywallDisplayed) {
      if (kDebugMode) {
        print("Paywall already displayed, skipping...");
      }
      return;
    }

    await prefs?.setBool("paywall_displayed", true);

    if (user != null) {
      if (UserService.isSubscriptionActive(user)) {
        return;
      }
    }

    if (!context.mounted) {
      if (kDebugMode) {
        print("Context is not mounted, skipping paywall display...");
      }
      return;
    }
    if (isDesktop(context)) {
      await showDialog(
        context: context,
        builder: (context) => Dialog(
            child: SizedBox(
                width: getSize(context).width * 0.8,
                height: getSize(context).height * 0.8,
                child: const Paywall())),
      );
    } else {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SizedBox(
            width: getSize(context).width,
            height: getSize(context).height * 0.85,
            child: const Paywall()),
      );
    }

    await prefs?.setBool("paywall_displayed", false);
  }
}
