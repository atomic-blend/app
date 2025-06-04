import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/revenue_cat_service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/toast_helper.dart';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/object_wrappers.dart';

class Paywall extends StatefulWidget {
  const Paywall({super.key});

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  AsyncMemoizer<Offerings?>? _memoizer;
  Package? _package;

  @override
  void initState() {
    _memoizer = AsyncMemoizer();
    super.initState();
  }

  _fetchOfferings() {
    return _memoizer!.runOnce(() async {
      final offerings = await RevenueCatService.getOfferings();
      _package = offerings?.current?.availablePackages.firstWhere(
        (package) => package.storeProduct.identifier == "cloud_yearly",
        orElse: () => offerings.current!.availablePackages.first,
      );
      return offerings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($constants.insets.md),
      child: Column(
        children: [
          SizedBox(
            height: getSize(context).height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: ElevatedContainer(
                          width: 40,
                          height: 40,
                          borderRadius: $constants.corners.full,
                          child: const Icon(
                            CupertinoIcons.xmark,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getSize(context).height * 0.1,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular($constants.corners.xl),
                      child: Image.asset(
                        'assets/images/atomic_blend_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  Text(
                    context.t.paywall.title,
                    style: getTextTheme(context).headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    context.t.paywall.subtitle,
                    textAlign: TextAlign.center,
                    style: getTextTheme(context).bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  ElevatedContainer(
                    width: double.infinity,
                    borderRadius: $constants.corners.sm,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.md,
                      vertical: $constants.insets.md,
                    ),
                    child: Column(
                      spacing: $constants.insets.md,
                      children: [
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.all_apps_of_the_suite.title,
                          description: context.t.paywall.advantages
                              .all_apps_of_the_suite.description,
                          icon: CupertinoIcons.square_grid_2x2,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.end_to_end_encrypted.title,
                          description: context.t.paywall.advantages
                              .end_to_end_encrypted.description,
                          icon: CupertinoIcons.lock,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.unlimited_tasks.title,
                          description: context
                              .t.paywall.advantages.unlimited_tasks.description,
                          icon: CupertinoIcons.checkmark_square,
                        ),
                        _buildAdvantageRow(
                          title:
                              context.t.paywall.advantages.unlimited_tags.title,
                          description: context
                              .t.paywall.advantages.unlimited_tags.description,
                          icon: CupertinoIcons.tags,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.unlimited_habits.title,
                          description: context.t.paywall.advantages
                              .unlimited_habits.description,
                          icon: CupertinoIcons.repeat,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.sync_across_devices.title,
                          description: context.t.paywall.advantages
                              .sync_across_devices.description,
                          icon: CupertinoIcons.cloud,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.community_backed.title,
                          description: context.t.paywall.advantages
                              .community_backed.description,
                          icon: CupertinoIcons.person_3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: $constants.insets.md,
          ),
          const Divider(),
          SizedBox(
            height: $constants.insets.xs,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<Offerings?>(
                    future: _fetchOfferings(),
                    builder: (context, snapshot) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (_package == null &&
                            snapshot.data?.current?.availablePackages
                                    .isNotEmpty ==
                                true) {
                          _package = snapshot.data!.current!.availablePackages
                              .firstWhere((package) =>
                                  package.storeProduct.identifier ==
                                  "cloud_yearly");
                        }
                      });

                      if (snapshot.connectionState == ConnectionState.waiting ||
                          snapshot.data == null) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: getTheme(context).primary,
                          ),
                        );
                      }
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: $constants.insets.sm,
                        children: [
                          _buildPricingCard(context,
                              package: snapshot.data!.current!.availablePackages
                                  .firstWhere((package) =>
                                      package.storeProduct.identifier ==
                                      "cloud_yearly")),
                          _buildPricingCard(context,
                              package: snapshot.data!.current!.availablePackages
                                  .firstWhere((package) =>
                                      package.storeProduct.identifier ==
                                      "cloud_monthly")),
                        ],
                      );
                    }),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                PrimaryButtonSquare(
                    text: context.t.actions.subscribe,
                    onPressed: () async {
                      if (_package == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(context.t.paywall.no_package_selected),
                          ),
                        );
                        return;
                      }
                      final customerInfo =
                          await _makePurchase(package: _package!);
                      if (customerInfo == null) {
                        if (!context.mounted) return;
                        ToastHelper.showError(
                            context: context,
                            title: context.t.paywall.purchase_failed);
                      }
                    }),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextButton(
                            child: Text(
                              context.t.paywall.restore_purchase,
                              style: getTextTheme(context).bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: getTheme(context).primary,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Expanded(
                        child: TextButton(
                            child: Text(
                              context.t.paywall.terms,
                              style: getTextTheme(context).bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: getTheme(context).primary,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Expanded(
                        child: TextButton(
                            child: Text(
                              context.t.paywall.privacy_policy,
                              style: getTextTheme(context).bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: getTheme(context).primary,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildPricingCard(BuildContext context, {required Package package}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _package = package;
          });
        },
        child: ElevatedContainer(
          height: getSize(context).height * 0.1,
          width: double.infinity,
          borderRadius: $constants.corners.sm,
          border: _package == package
              ? Border.all(
                  color: getTheme(context).primary,
                  width: 2,
                )
              : null,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.xxs,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    height: 15,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                    ),
                    decoration: BoxDecoration(
                      color: context
                                  .t
                                  .paywall
                                  .pricing[package.storeProduct.identifier]
                                  ?.discount !=
                              ""
                          ? getTheme(context).primary.withValues(alpha: 0.2)
                          : Colors.transparent,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    child: context
                                .t
                                .paywall
                                .pricing[package.storeProduct.identifier]
                                ?.discount !=
                            ""
                        ? Text(
                            context
                                .t
                                .paywall
                                .pricing[package.storeProduct.identifier]!
                                .discount,
                            style: getTextTheme(context).bodySmall!.copyWith(
                                  color: getTheme(context).primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                Text(
                  context.t.paywall.pricing[package.storeProduct.identifier]!
                      .title,
                  style: getTextTheme(context).bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  context.t.paywall.pricing[package.storeProduct.identifier]!
                      .price,
                  style: getTextTheme(context).bodyMedium,
                ),
                Text(
                  context.t.paywall.pricing[package.storeProduct.identifier]!
                      .billed,
                  style: getTextTheme(context).bodySmall!.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAdvantageRow({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Icon(
            icon,
            color: getTheme(context).primary,
          ),
        ),
        SizedBox(width: $constants.insets.md),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: getTextTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, height: 1),
            ),
            Flexible(
              child: SizedBox(
                width: getSize(context).width * 0.66,
                child: Text(
                  description,
                  style: getTextTheme(context).bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<CustomerInfo?> _makePurchase({required Package package}) async {
    try {
      final customerInfo =
          await RevenueCatService.makePurchase(package: package);
      return customerInfo;
    } catch (e) {
      // Handle purchase error
      return null;
    }
  }
}
