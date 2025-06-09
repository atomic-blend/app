import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/purchase/purchase.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/revenue_cat_service.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/toast_helper.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionPayments extends StatefulWidget {
  const SubscriptionPayments({super.key});

  @override
  State<SubscriptionPayments> createState() => _SubscriptionPaymentsState();
}

class _SubscriptionPaymentsState extends State<SubscriptionPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.account.subscription_payments.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
        final currentSubscription = UserService.getCurrentSubscription(
          authState.user,
        );

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
            vertical: $constants.insets.xs,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedContainer(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: $constants.insets.md,
                    horizontal: $constants.insets.md,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          context.t.account.subscription_payments.subscription(
                              subName: context
                                  .t
                                  .paywall
                                  .pricing[currentSubscription
                                      .purchaseData["product_id"]]
                                  .title),
                          style: getTextTheme(context).headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                      Text(
                        context.t.account.subscription_payments
                            .latest_subscription,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                            ),
                      ),
                      SizedBox(height: $constants.insets.xs),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      SizedBox(height: $constants.insets.xs),
                      _buildIconTextRow(
                        context,
                        currentSubscription: currentSubscription,
                        icon: CupertinoIcons.calendar,
                        title: context
                            .t.account.subscription_payments.billing_cycle
                            .toUpperCase(),
                        value: context
                            .t
                            .paywall
                            .pricing[
                                currentSubscription.purchaseData["product_id"]]
                            .title,
                      ),
                      SizedBox(height: $constants.insets.sm),
                      _buildIconTextRow(
                        context,
                        currentSubscription: currentSubscription,
                        icon: CupertinoIcons.money_euro,
                        title: context
                            .t.account.subscription_payments.current_price
                            .toUpperCase(),
                        value: context
                            .t
                            .paywall
                            .pricing[
                                currentSubscription.purchaseData["product_id"]]
                            .price,
                      ),
                      SizedBox(height: $constants.insets.sm),
                      _buildIconTextRow(
                        context,
                        currentSubscription: currentSubscription,
                        icon: CupertinoIcons.creditcard,
                        title: context
                            .t.account.subscription_payments.next_billing_date
                            .toUpperCase(),
                        value: Jiffy.parseFromDateTime(
                                UserService.getNextBillingDate(
                                    currentSubscription))
                            .yMMMEdjm
                            .capitalize,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: $constants.insets.sm),
                ElevatedContainer(
                  width: double.infinity,
                  height: getSize(context).height * 0.4,
                  padding: EdgeInsets.symmetric(
                    vertical: $constants.insets.md,
                    horizontal: $constants.insets.md,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                              .t.account.subscription_payments.payment_history,
                          style: getTextTheme(context).headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: $constants.insets.xs),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        SizedBox(height: $constants.insets.xs),
                        if (authState.user?.purchases?.isEmpty ?? true)
                          Text(
                            context.t.account.subscription_payments.no_payments,
                            style: getTextTheme(context).bodyMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                          )
                        else
                          ...authState.user!.purchases!.map((purchase) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: $constants.insets.sm,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: getTheme(context).surface,
                                      borderRadius: BorderRadius.circular(
                                          $constants.corners.sm),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.money_euro,
                                      size: 25,
                                    ),
                                  ),
                                  SizedBox(width: $constants.insets.sm),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Jiffy.parseFromDateTime(
                                                purchase.createdAt)
                                            .yMMMEdjm
                                            .capitalize,
                                        style: getTextTheme(context)
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        context
                                            .t
                                            .paywall
                                            .pricing[purchase
                                                .purchaseData["product_id"]]
                                            .title,
                                        style: getTextTheme(context)
                                            .bodyMedium!
                                            .copyWith(
                                              color: Colors.grey.shade600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${purchase.purchaseData["currency"].toString()} ${purchase.purchaseData["price_in_purchased_currency"].toString()}",
                                    style: getTextTheme(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            );
                          })
                      ],
                    ),
                  ),
                ),
                SizedBox(height: $constants.insets.sm),
                ElevatedContainer(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: $constants.insets.sm,
                      horizontal: $constants.insets.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final managementUrl =
                              await RevenueCatService.getManagementUrl();
                          if (managementUrl != null) {
                            await launchUrl(Uri.parse(managementUrl));
                          } else {
                            if (!context.mounted) return;
                            ToastHelper.showError(
                              context: context,
                              title: context.t.account.subscription_payments
                                  .management_url_only_mobile,
                            );
                          }
                        },
                        child: Text(
                          context.t.account.subscription_payments
                              .manage_my_subscription,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                color: CupertinoColors.activeBlue,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Row _buildIconTextRow(
    BuildContext context, {
    required Purchase currentSubscription,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        SizedBox(width: $constants.insets.sm),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: getTextTheme(context).bodyMedium!.copyWith(
                      color: Colors.grey.shade600,
                    )),
            Text(value)
          ],
        )
      ],
    );
  }
}
