import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/revenue_cat_service.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/toast_helper.dart';
import 'package:async/async.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:purchases_flutter/object_wrappers.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Paywall extends StatefulWidget {
  const Paywall({super.key});

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  AsyncMemoizer<Offerings?>? _memoizer;
  Package? _package;
  bool? _isMakingPurchase;
  Timer? _checkPurchaseTimer;
  bool? _purchaseSuccess;
  bool? _purchaseFailed;
  int? _mobilePlatform = 0; // 0 for iOS, 1 for Android

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
    if (_purchaseSuccess == true) {
      return _buildPurchaseSuccess(context);
    } else if (_purchaseFailed == true) {
      return _buildPurchaseFailed(context);
    } else if (_isMakingPurchase == true || _checkPurchaseTimer != null) {
      return _buildPurchaseLoading(context);
    }

    return Padding(
      padding: EdgeInsets.all($constants.insets.md),
      child: SingleChildScrollView(
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
                            title: context.t.paywall.advantages
                                .all_apps_of_the_suite.title,
                            description: context.t.paywall.advantages
                                .all_apps_of_the_suite.description,
                            icon: CupertinoIcons.square_grid_2x2,
                          ),
                          _buildAdvantageRow(
                            title: context.t.paywall.advantages
                                .end_to_end_encrypted.title,
                            description: context.t.paywall.advantages
                                .end_to_end_encrypted.description,
                            icon: CupertinoIcons.lock,
                          ),
                          _buildAdvantageRow(
                            title: context
                                .t.paywall.advantages.unlimited_tasks.title,
                            description: context.t.paywall.advantages
                                .unlimited_tasks.description,
                            icon: CupertinoIcons.checkmark_square,
                          ),
                          _buildAdvantageRow(
                            title: context
                                .t.paywall.advantages.unlimited_tags.title,
                            description: context.t.paywall.advantages
                                .unlimited_tags.description,
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
            if (isDesktop(context)) _buildPaymentMobileOnly(context),
            if (!isDesktop(context))
              Column(
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

                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
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
                            _buildPricingCard(
                              context,
                              package: snapshot.data!.current!.availablePackages
                                  .firstWhere(
                                (package) =>
                                    package.identifier == '\$rc_monthly',
                              ),
                            ),
                            _buildPricingCard(
                              context,
                              package: snapshot.data!.current!.availablePackages
                                  .firstWhere((package) =>
                                      package.identifier == '\$rc_annual'),
                            ),
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
                                style:
                                    getTextTheme(context).bodySmall!.copyWith(
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
                                style:
                                    getTextTheme(context).bodySmall!.copyWith(
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
                                style:
                                    getTextTheme(context).bodySmall!.copyWith(
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
              )
          ],
        ),
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
                if (context.t.paywall.pricing[package.identifier]?.discount !=
                    "")
                  Center(
                    child: Container(
                      height: 15,
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                      ),
                      decoration: BoxDecoration(
                        color: context.t.paywall.pricing[package.identifier]
                                    ?.discount !=
                                ""
                            ? getTheme(context).primary.withValues(alpha: 0.2)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular($constants.corners.sm),
                      ),
                      child: context.t.paywall.pricing[package.identifier]
                                  ?.discount !=
                              ""
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  context.t.paywall.pricing[package.identifier]!
                                      .discount,
                                  style:
                                      getTextTheme(context).bodySmall!.copyWith(
                                            color: getTheme(context).primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  )
                else
                  const SizedBox(
                    height: 15,
                  ),
                Text(
                  context.t.paywall.pricing[package.identifier]!.title,
                  style: getTextTheme(context).bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  context.t.paywall.pricing[package.identifier]!.price,
                  style: getTextTheme(context).bodyMedium,
                ),
                Text(
                  context.t.paywall.pricing[package.identifier]!.billed,
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
                width: getSize(context).width * 0.6,
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
      setState(() {
        _isMakingPurchase = true;
      });
      final customerInfo =
          await RevenueCatService.makePurchase(package: package);
      if (!mounted) return null;
      _startCheckingForPurchase(context);
      return customerInfo;
    } catch (e) {
      // Handle purchase error
      return null;
    }
  }

  _startCheckingForPurchase(BuildContext context) {
    setState(() {
      int loopCount = 0;
      _checkPurchaseTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        loopCount++;
        final authState = context.read<AuthBloc>().state;
        final isUserHaveActiveSubscription =
            UserService.isSubscriptionActive(authState.user);
        if (isUserHaveActiveSubscription) {
          setState(() {
            _purchaseSuccess = true;
            _purchaseFailed = false;
          });
          // Show success message and close the paywall after a delay
          Timer(const Duration(seconds: 5), () {
            if (!context.mounted) return;
            Navigator.of(context).pop();
          });
          _checkPurchaseTimer?.cancel();
        } else if (loopCount >= 30) {
          setState(() {
            _checkPurchaseTimer?.cancel();
            _checkPurchaseTimer = null;
            _purchaseSuccess = false;
            _purchaseFailed = true;
          });
          _checkPurchaseTimer?.cancel();
        } else {
          if (authState.runtimeType != Loading) {
            context.read<AuthBloc>().add(const RefreshUser());
          }
        }
      });
    });
  }

  // when _purchaseSuccess is true
  Widget _buildPurchaseSuccess(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/credit_card_success.json',
              width: getSize(context).width,
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            Text(
              context.t.paywall.success,
              style: getTextTheme(context).headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            const Spacer(),
            PrimaryButtonSquare(
              text: context.t.actions.close,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: $constants.insets.lg,
            ),
          ],
        ),
      ),
    );
  }

  // when _purchaseFailed is true, display the error corresponding to _errorId
  Widget _buildPurchaseFailed(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            SizedBox(
              height: getSize(context).height * 0.1,
            ),
            SizedBox(
              width: getSize(context).width * 0.8,
              height: getSize(context).height * 0.3,
              child: Transform.scale(
                scale: 2,
                child: Lottie.asset(
                  'assets/animations/failed.json',
                  width: getSize(context).width,
                ),
              ),
            ),
            SizedBox(
              height: $constants.insets.lg,
            ),
            Text(
              context.t.paywall.validation_failed,
              style: getTextTheme(context).headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            Text(
              context.t.paywall.validation_failed_description,
              textAlign: TextAlign.center,
              style: getTextTheme(context).bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            const Spacer(),
            PrimaryButtonSquare(
              text: context.t.actions.close,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: $constants.insets.lg,
            ),
          ],
        ),
      ),
    );
  }

  // when _isMakingPurchase is true, display a "making purchase" loading widget
  // when _checkPurchaseTimer is running, display a "checking purchase" loading widget
  Widget _buildPurchaseLoading(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            SizedBox(
              height: getSize(context).height * 0.1,
            ),
            Lottie.asset(
              'assets/animations/apple_pay.json',
              width: getSize(context).width,
            ),
            SizedBox(
              height: $constants.insets.lg,
            ),
            Text(
              context.t.paywall.payment_in_progress,
              style: getTextTheme(context).headlineSmall,
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            Text(
              context.t.paywall.payment_in_progress_description,
              textAlign: TextAlign.center,
              style: getTextTheme(context).bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMobileOnly(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: getSize(context).height * 0.2,
            child: ElevatedContainer(
              padding: EdgeInsets.all($constants.insets.sm),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: AnimatedToggleSwitch.rolling(
                      indicatorSize:
                          Size.fromWidth(getSize(context).width * 0.2 / 2),
                      current: _mobilePlatform,
                      values: const [0, 1],
                      iconBuilder: (value, foreground) {
                        return AutoSizeText(
                            maxLines: 1,
                            value == 0
                                ? context.t.paywall.ios
                                : context.t.paywall.android,
                            style:
                                getTextTheme(context).bodyMedium!.copyWith());
                      },
                      styleBuilder: (value) {
                        return ToggleStyle(
                          borderColor: Colors.transparent,
                          indicatorColor: value == _mobilePlatform
                              ? getTheme(context).surfaceContainer
                              : getTheme(context).surface,
                          backgroundColor: getTheme(context).surface,
                        );
                      },
                      onChanged: (value) {
                        setState(() {
                          _mobilePlatform = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.xs,
                  ),
                  QrImageView(
                    version: QrVersions.auto,
                    data: _mobilePlatform == 0
                        ? "https://apps.apple.com/fr/app/atomic-task/id6743615832"
                        : "https://play.google.com/store/apps/details?id=fr.atomicblend.app",
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: $constants.insets.lg,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.t.paywall.mobile_app_required,
                style: getTextTheme(context).headlineSmall,
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              SizedBox(
                width: getSize(context).width * 0.4,
                child: Text(
                  context.t.paywall.payment_on_mobile_for_better_xp,
                  textAlign: TextAlign.center,
                  style: getTextTheme(context).bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
