import 'package:app/pages/paywall/paywall.dart';
import 'package:app/utils/api_client.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class PaywallUtils {
  static showPaywall(BuildContext context) {
    if (ApiClient.getSelfHostedRestApiUrl() != null) {
      return;
    }

    if (isDesktop(context)) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
            child: SizedBox(
                width: getSize(context).width * 0.8,
                height: getSize(context).height * 0.6,
                child: const Paywall())),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SizedBox(
            width: getSize(context).width,
            height: getSize(context).height * 0.75,
            child: const Paywall()),
      );
    }
  }
}
