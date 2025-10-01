import 'dart:io';

import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/app/ab_sidemenu.dart';
import 'package:ab_shared/pages/auth/sso_module.dart';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/responsive_stateful_widget.dart';
import 'package:ab_shared/pages/paywall/paywall_utils.dart';
import 'package:ab_shared/services/device_info.service.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:app/pages/tasks/add_task_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:macos_window_utils/widgets/titlebar_safe_area.dart';
import 'package:app/main.dart';
import 'package:app/utils/nav_constants.dart';
import 'package:app/services/sync.service.dart';
import 'package:icons_plus/icons_plus.dart';

class AppLayout extends ResponsiveStatefulWidget {
  const AppLayout({super.key});

  @override
  AppLayoutState createState() => AppLayoutState();
}

class AppLayoutState extends ResponsiveState<AppLayout> {
  final SideMenuController _primarySideMenuController = SideMenuController();

  @override
  void initState() {
    context.read<AuthBloc>().add(const RefreshUser());
    PaywallUtils.resetPaywall(
      prefs: prefs!,
    );

    if (context.read<AuthBloc>().state.user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (context.read<AuthBloc>().state.user?.devices == null) {
          context.read<AuthBloc>().state.user?.devices = [];
        }
        final deviceInfoService = DeviceInfoService();
        final userDeviceInfo = await deviceInfoService.getDeviceInfo();

        if (!context.mounted) return;
        // ignore: use_build_context_synchronously
        context.read<AuthBloc>().add(
              UpdateUserDevice(
                // ignore: use_build_context_synchronously
                context.read<AuthBloc>().state.user!,
                userDeviceInfo,
              ),
            );
        // }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = buildMobile(context);
    if (isDesktop(context)) {
      body = buildDesktop(context);
    }
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      if (authState is! LoggedIn) {
        return Scaffold(
          body: SSOModule(
            encryptionService: encryptionService,
            globalApiClient: globalApiClient,
            prefs: prefs,
            env: env,
          ),
        );
      }
      return body;
    });
  }

  @override
  Widget buildMobile(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
          _runAppInitAndChecks(context: context, authState: authState);

          if (authState is! LoggedIn) {
            return Scaffold(
              body: SSOModule(
                encryptionService: encryptionService,
                globalApiClient: globalApiClient,
                prefs: prefs,
                env: env,
              ),
            );
          }

          var primaryMenuItems = $navConstants.primaryMenuItems(context);

          // get the primary menu item and its secondary items
          var primaryMenuItem = primaryMenuItems
              .where((item) =>
                  (item.key as ValueKey).value ==
                  appState.primaryMenuSelectedKey)
              .firstOrNull;
          final secondaryItems = primaryMenuItem?.subItems ?? [];
          // by default, the primary menu is selected
          Widget? body = primaryMenuItem?.body;
          AppBar? appBar = primaryMenuItem?.appBar;

          // select the items if there's a secondary menu and a secondary menu item is selected
          if (secondaryItems.isNotEmpty &&
              appState.secondaryMenuSelectedKey != '') {
            body = secondaryItems
                .where((item) =>
                    (item.key as ValueKey).value ==
                    appState.secondaryMenuSelectedKey)
                .firstOrNull
                ?.body;

            final secondaryAppBar = secondaryItems
                .where((item) =>
                    (item.key as ValueKey).value ==
                    appState.secondaryMenuSelectedKey)
                .firstOrNull
                ?.appBar;

            // use the secondary appBar if it exists, else let the parent appBar
            if (secondaryAppBar != null) {
              appBar = secondaryAppBar;
            }
          }

          final drawer = TapRegion(
            onTapOutside: (_) {
              Navigator.of(context).pop();
            },
            child: ABSideMenu(
              controller: _primarySideMenuController,
              primaryMenuItems: primaryMenuItems,
              primaryMenuKey: appState.primaryMenuSelectedKey,
              secondaryMenuKey: appState.secondaryMenuSelectedKey,
              onItemTap: (item) {
                if (item.onTap != null) {
                  item.onTap!(0);
                  return;
                }
                context.read<AppCubit>().changePrimaryMenuSelectedKey(
                      key: (item.key as ValueKey).value,
                    );
                if (item.mainSecondaryKey != null) {
                  context.read<AppCubit>().changeSecondaryMenuSelectedKey(
                        key: item.mainSecondaryKey!,
                      );
                }
                Navigator.of(context).pop();
              },
              onSubItemTap: (item, subItem) {
                if (item.onTap != null) {
                  subItem.onTap!(0);
                  return;
                }
                context.read<AppCubit>().changePrimaryMenuSelectedKey(
                      key: (item.key as ValueKey).value,
                    );
                context.read<AppCubit>().changeSecondaryMenuSelectedKey(
                      key: (subItem.key as ValueKey).value,
                    );
                Navigator.of(context).pop();
              },
            ),
          );

          return Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Scaffold(
                      // if there's secondary, show the secondary item appBar
                      // else show the primary appBar
                      appBar: appBar,
                      drawer: drawer,
                      backgroundColor: getTheme(context).surface,
                      body: Stack(children: [
                        body ?? Container(),
                        Positioned(
                          bottom: $constants.insets.lg,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.md),
                            child: ABNavbar(
                              backgroundColor:
                                  getTheme(context).surfaceContainer,
                              onPrimaryMenuSelected: (key) {
                                context
                                    .read<AppCubit>()
                                    .changePrimaryMenuSelectedKey(
                                      key: key,
                                    );
                              },
                              onSecondaryMenuSelected: (key) {
                                context
                                    .read<AppCubit>()
                                    .changeSecondaryMenuSelectedKey(
                                      key: key,
                                    );
                              },
                              destinations:
                                  $navConstants.primaryMenuItems(context),
                              primaryMenuKey: appState.primaryMenuSelectedKey,
                              centerActionEnabled: true,
                              centerActionIcon: LineAwesome.plus_solid,
                              centerActionCallback: () {
                                if (isDesktop(context)) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            child: SizedBox(
                                              height:
                                                  getSize(context).height * 0.8,
                                              width:
                                                  getSize(context).width * 0.8,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        $constants.corners.md),
                                                child: AddTaskModal(),
                                              ),
                                            ),
                                          ));
                                } else {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    isDismissible: false,
                                    enableDrag: false,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => SizedBox(
                                        height: getSize(context).height * 0.92,
                                        child: AddTaskModal()),
                                  );
                                }
                                SyncService.sync(context);
                              },
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              )
            ],
          );
        });
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
          _runAppInitAndChecks(context: context, authState: authState);

          // get the secondary items from the selected primary menu item
          final primaryMenuItem = $navConstants
              .primaryMenuItems(context)
              .where((item) =>
                  (item.key as ValueKey).value ==
                  appState.primaryMenuSelectedKey)
              .firstOrNull;
          final secondaryItems = primaryMenuItem?.subItems ?? [];

          // by default, the primary menu is selected
          Widget? body = $navConstants
              .primaryMenuItems(context)
              .where((item) =>
                  (item.key as ValueKey).value ==
                  appState.primaryMenuSelectedKey)
              .firstOrNull
              ?.body;
          AppBar? appBar = $navConstants
              .primaryMenuItems(context)
              .where((item) =>
                  (item.key as ValueKey).value ==
                  appState.primaryMenuSelectedKey)
              .firstOrNull
              ?.appBar;

          // on desktop, move the 4th primary menu item to the end of the list
          final primaryMenuItems =
              $navConstants.primaryMenuItems(context).toList();
          if (primaryMenuItems.length > 4) {
            final itemToMove = primaryMenuItems.removeAt(4);
            primaryMenuItems.add(itemToMove);
          }

          // select the items if there's a secondary menu and a secondary menu item is selected
          if (secondaryItems.isNotEmpty &&
              appState.secondaryMenuSelectedKey != '') {
            body = secondaryItems
                .where((item) =>
                    (item.key as ValueKey).value ==
                    appState.secondaryMenuSelectedKey)
                .firstOrNull
                ?.body;

            final secondaryAppBar = secondaryItems
                .where((item) =>
                    (item.key as ValueKey).value ==
                    appState.secondaryMenuSelectedKey)
                .firstOrNull
                ?.appBar;

            // use the secondary appBar if it exists, else let the parent appBar
            if (secondaryAppBar != null) {
              appBar = secondaryAppBar;
            }
          }

          final renderedBody = Flex(
            direction: Axis.horizontal,
            children: [
              // primary menu items
              ABSideMenu(
                controller: _primarySideMenuController,
                primaryMenuItems: primaryMenuItems,
                primaryMenuKey: appState.primaryMenuSelectedKey,
                secondaryMenuKey: appState.secondaryMenuSelectedKey,
                onItemTap: (item) {
                  if (item.onTap != null) {
                    item.onTap!(0);
                    return;
                  }
                  context.read<AppCubit>().changePrimaryMenuSelectedKey(
                        key: (item.key as ValueKey).value,
                      );
                  if (item.mainSecondaryKey != null) {
                    context.read<AppCubit>().changeSecondaryMenuSelectedKey(
                          key: item.mainSecondaryKey!,
                        );
                  }
                },
                onSubItemTap: (item, subItem) {
                  if (item.onTap != null) {
                    subItem.onTap!(0);
                    return;
                  }
                  context.read<AppCubit>().changePrimaryMenuSelectedKey(
                        key: (item.key as ValueKey).value,
                      );
                  context.read<AppCubit>().changeSecondaryMenuSelectedKey(
                        key: (subItem.key as ValueKey).value,
                      );
                },
              ),
              Expanded(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    // secondary menu items
                    Expanded(
                      child: Scaffold(
                        // if there's secondary, show the secondary item appBar
                        // else show the primary appBar
                        appBar: appBar,
                        // if there's secondary, show the secondary item body
                        // else show the primary item body
                        body: body,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );

          if (!kIsWeb && Platform.isMacOS) {
            return TitlebarSafeArea(child: renderedBody);
          }
          return SafeArea(child: renderedBody);
        });
      },
    );
  }

  _runAppInitAndChecks({
    required BuildContext context,
    required AuthState authState,
  }) {
    if (authState is LoggedIn) {
      encryptionService ??= EncryptionService(
        userSalt: authState.user!.keySet.salt,
        prefs: prefs!,
        userKey: userKey,
        agePublicKey: agePublicKey,
      );
      if (isPaymentSupported()) revenueCatService?.logIn(authState.user!.id!);
    }
  }
}
