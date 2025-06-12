import 'dart:io';

import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/buttons/account_avatar_with_sync_status.dart';
import 'package:app/components/responsive_stateful_widget.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/auth/login_or_register_modal.dart';
import 'package:app/pages/paywall/paywall_utils.dart';
import 'package:app/pages/tasks/filtered_view.dart';
import 'package:app/services/device_info.service.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/services/revenue_cat_service.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:macos_window_utils/widgets/titlebar_safe_area.dart';

class AppLayout extends ResponsiveStatefulWidget {
  const AppLayout({super.key});

  @override
  AppLayoutState createState() => AppLayoutState();
}

class AppLayoutState extends ResponsiveState<AppLayout> {
  bool _isLoginModalVisible = false;
  final SideMenuController _secondarySideMenuController = SideMenuController();
  final SideMenuController _primarySideMenuController = SideMenuController();

  @override
  void initState() {
    context.read<AuthBloc>().add(const RefreshUser());
    PaywallUtils.resetPaywall();

    if (!isDesktop(context)) {
      RevenueCatService.initPlatformState();
    }

    if (context.read<AuthBloc>().state.user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (context.read<AuthBloc>().state.user?.devices == null) {
          context.read<AuthBloc>().state.user?.devices = [];
        }
        deviceInfoService ??= DeviceInfoService();

        final userDeviceInfo = await deviceInfoService!.getDeviceInfo();

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
  Widget buildMobile(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<FolderBloc, FolderState>(
            builder: (context, folderState) {
          return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
            _runAppInitAndChecks(
                context: context, appState: appState, authState: authState);

            // get the secondary section based on the selected primary menu
            final secondarySection = $constants.navigation
                .secondaryMenuSections(context)
                .where(
                  (section) =>
                      (section.key as ValueKey).value ==
                      appState.primaryMenuSelectedKey,
                )
                .firstOrNull;

            var primaryMenuItem = $constants.navigation
                .primaryMenuItems(context)
                .where((item) =>
                    (item.key as ValueKey).value ==
                    appState.primaryMenuSelectedKey)
                .firstOrNull;
            // by default, the primary menu is selected
            Widget? body = primaryMenuItem?.body;
            AppBar? appBar = primaryMenuItem?.appBar;

            // if primary key is tasks, get the folders, and add them to the secondary section items at the right place (4th), after all folders
            if (appState.primaryMenuSelectedKey == 'tasks' &&
                folderState is FolderLoaded) {
              var folders = folderState.folders ?? [];

              final folderItems = <NavigationItem>[];
              for (var folder in folders) {
                folderItems.add(
                  NavigationItem(
                    key: ValueKey(folder.name),
                    icon: folder.emoji != null
                        ? SizedBox(
                            height: 25, width: 25, child: Text(folder.emoji!))
                        : const Icon(Icons.collections),
                    cupertinoIcon: folder.emoji != null
                        ? Center(
                            child: Text(folder.emoji!,
                                style: const TextStyle(fontSize: 25)))
                        : const Icon(CupertinoIcons.collections),
                    label: folder.name,
                    color: getTheme(context).tertiary,
                    body: FilteredTaskView(
                      filter: (List<TaskEntity> tasks) {
                        final List<TaskEntity> widgets = [];
                        for (final task in tasks) {
                          if (task.completed != true &&
                              task.folderId == folder.id) {
                            widgets.add(task);
                          }
                        }
                        return widgets;
                      },
                    ),
                    appBar: AppBar(
                      backgroundColor: getTheme(context).surface,
                      title: Text(
                        folder.name,
                        style: getTextTheme(context).headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      actions: [
                        BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, authState) {
                          if (authState is LoggedIn && !isDesktop(context)) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(right: $constants.insets.sm),
                              child: const AccountAvatarWithSyncStatus(),
                            );
                          }
                          return Container();
                        }),
                      ],
                    ),
                  ),
                );
              }
              // add the folders to the secondary section items at the right place (4th), after all folders
              secondarySection?.items.insertAll(4, folderItems);
            }

            // select the items if there's a secondary menu and a secondary menu item is selected
            if (secondarySection != null &&
                secondarySection.items.isNotEmpty &&
                appState.secondaryMenuSelectedKey != '') {
              body = secondarySection.items
                  .where((item) =>
                      (item.key as ValueKey).value ==
                      appState.secondaryMenuSelectedKey)
                  .firstOrNull
                  ?.body;

              final secondaryAppBar = secondarySection.items
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

            return Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Scaffold(
                    // if there's secondary, show the secondary item appBar
                    // else show the primary appBar
                    appBar: appBar,
                    backgroundColor: getTheme(context).surface,
                    drawer: TapRegion(
                      onTapOutside: (_) {
                        Navigator.of(context).pop();
                      },
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular($constants.corners.xxl),
                        child: SideMenu(
                          controller: _secondarySideMenuController,
                          mode: SideMenuMode.open,
                          hasResizer: false,
                          hasResizerToggle: false,
                          minWidth: getSize(context).width * 0.18,
                          backgroundColor: getTheme(context).surfaceContainer,
                          builder: (data) {
                            return SideMenuData(
                              header: SafeArea(
                                top: true,
                                bottom: false,
                                left: false,
                                right: false,
                                child: ElevatedContainer(
                                  width: 50,
                                  height: 50,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        $constants.corners.md,
                                      ),
                                      child: Image.asset(
                                          "assets/images/appicon.png")),
                                ),
                              ),
                              customChild: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: $constants.insets.xs,
                                    ),
                                    ...?secondarySection?.items
                                        .map((item) => Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (item.separatorBefore !=
                                                    true)
                                                  SizedBox(
                                                    height:
                                                        $constants.insets.xxs,
                                                  ),
                                                if (item.separatorBefore ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          $constants.insets.sm,
                                                    ),
                                                    child: Divider(
                                                      color:
                                                          Colors.grey.shade300,
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (item.onTap != null) {
                                                      item.onTap!(0);
                                                    } else {
                                                      context
                                                          .read<AppCubit>()
                                                          .changeSecondaryMenuSelectedKey(
                                                            key: (item.key
                                                                    as ValueKey)
                                                                .value,
                                                          );
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                $constants
                                                                    .insets.sm),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: appState
                                                                            .secondaryMenuSelectedKey ==
                                                                        (item.key
                                                                                as ValueKey)
                                                                            .value
                                                                    ? Border
                                                                        .all(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        width:
                                                                            1,
                                                                      )
                                                                    : null,
                                                                color: item
                                                                            .color !=
                                                                        null
                                                                    ? item.color!.withValues(
                                                                        alpha: getTheme(context).brightness == Brightness.dark
                                                                            ? 0.4
                                                                            : 0.2)
                                                                    : Colors
                                                                        .grey
                                                                        .shade400
                                                                        .withValues(
                                                                            alpha:
                                                                                0.2),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        $constants
                                                                            .corners
                                                                            .lg),
                                                              ),
                                                              child: item.initialsOnly ==
                                                                      true
                                                                  ? Center(
                                                                      child:
                                                                          Text(
                                                                        _getInitials(
                                                                            item.label),
                                                                        style: getTextTheme(context)
                                                                            .bodyLarge!
                                                                            .copyWith(
                                                                              fontWeight: FontWeight.bold,
                                                                              color: item.color != null ? item.color! : Colors.grey.shade800,
                                                                            ),
                                                                      ),
                                                                    )
                                                                  : IconTheme(
                                                                      data:
                                                                          IconThemeData(
                                                                        color: getTheme(context).brightness ==
                                                                                Brightness.light
                                                                            ? item.color != null
                                                                                ? item.color!
                                                                                : Colors.grey.shade800
                                                                            : Colors.white,
                                                                      ),
                                                                      child: isApple(
                                                                              context)
                                                                          ? item
                                                                              .cupertinoIcon
                                                                          : item
                                                                              .icon),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: $constants
                                                              .insets.sm,
                                                        ),
                                                        Text(item.label)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    body: body,
                    bottomNavigationBar: BottomNavigation(
                      destinations: $constants.navigation
                          .primaryMenuItems(context)
                          .take(5)
                          .toList(),
                      primaryMenuKey: appState.primaryMenuSelectedKey,
                    ),
                  ),
                )
              ],
            );
          });
        });
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<FolderBloc, FolderState>(
            builder: (context, folderState) {
          return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
            _runAppInitAndChecks(
                context: context, appState: appState, authState: authState);

            // get the secondary section based on the selected primary menu
            final secondarySection = $constants.navigation
                .secondaryMenuSections(context)
                .where(
                  (section) =>
                      (section.key as ValueKey).value ==
                      appState.primaryMenuSelectedKey,
                )
                .firstOrNull;

            // by default, the primary menu is selected
            Widget? body = $constants.navigation
                .primaryMenuItems(context)
                .where((item) =>
                    (item.key as ValueKey).value ==
                    appState.primaryMenuSelectedKey)
                .firstOrNull
                ?.body;
            AppBar? appBar = $constants.navigation
                .primaryMenuItems(context)
                .where((item) =>
                    (item.key as ValueKey).value ==
                    appState.primaryMenuSelectedKey)
                .firstOrNull
                ?.appBar;

            // if primary key is tasks, get the folders, and add them to the secondary section items at the right place (4th), after all folders
            if (appState.primaryMenuSelectedKey == 'tasks' &&
                folderState is FolderLoaded) {
              var folders = folderState.folders ?? [];

              final folderItems = <NavigationItem>[];
              for (var folder in folders) {
                folderItems.add(
                  NavigationItem(
                    key: Key(folder.name),
                    icon: folder.emoji != null
                        ? SizedBox(
                            height: 25, width: 25, child: Text(folder.emoji!))
                        : const Icon(Icons.collections),
                    cupertinoIcon: folder.emoji != null
                        ? Center(
                            child: Text(folder.emoji!,
                                style: const TextStyle(fontSize: 25)))
                        : const Icon(CupertinoIcons.collections),
                    label: folder.name,
                    color: getTheme(context).tertiary,
                    body: FilteredTaskView(
                      filter: (List<TaskEntity> tasks) {
                        final List<TaskEntity> widgets = [];
                        for (final task in tasks) {
                          if (task.completed != true &&
                              task.folderId == folder.id) {
                            widgets.add(task);
                          }
                        }
                        return widgets;
                      },
                    ),
                    appBar: AppBar(
                      title: Text(
                        folder.name,
                        style: getTextTheme(context).headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      actions: [
                        if (authState is LoggedIn && !isDesktop(context))
                          Padding(
                            padding:
                                EdgeInsets.only(right: $constants.insets.sm),
                            child: const AccountAvatarWithSyncStatus(),
                          ),
                      ],
                    ),
                  ),
                );
              }
              // add the folders to the secondary section items at the right place (4th), after all folders
              secondarySection?.items.insertAll(4, folderItems);
            }

            // on desktop, move the 4th primary menu item to the end of the list
            final primaryMenuItems =
                $constants.navigation.primaryMenuItems(context).toList();
            if (primaryMenuItems.length > 4) {
              final itemToMove = primaryMenuItems.removeAt(4);
              primaryMenuItems.add(itemToMove);
            }

            // select the items if there's a secondary menu and a secondary menu item is selected
            if (secondarySection != null &&
                secondarySection.items.isNotEmpty &&
                appState.secondaryMenuSelectedKey != '') {
              body = secondarySection.items
                  .where((item) =>
                      (item.key as ValueKey).value ==
                      appState.secondaryMenuSelectedKey)
                  .firstOrNull
                  ?.body;

              final secondaryAppBar = secondarySection.items
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
                Padding(
                  padding: EdgeInsets.all($constants.insets.xs),
                  child: ElevatedContainer(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                      child: SideMenu(
                        controller: _primarySideMenuController,
                        mode: SideMenuMode.open,
                        minWidth: getSize(context).width * 0.08,
                        maxWidth: 180,
                        backgroundColor: getTheme(context).surfaceContainer,
                        hasResizer: false,
                        hasResizerToggle: false,
                        builder: (data) {
                          return SideMenuData(
                            header: Padding(
                              padding:
                                  EdgeInsets.only(top: $constants.insets.xs),
                              child: ElevatedContainer(
                                width: 50,
                                height: 50,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      $constants.corners.md,
                                    ),
                                    child: Image.asset(
                                        "assets/images/appicon.png")),
                              ),
                            ),
                            customChild: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: $constants.insets.xs,
                                  ),
                                  ...primaryMenuItems.map((item) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (item.separatorBefore != true)
                                            SizedBox(
                                              height: $constants.insets.xxs,
                                            ),
                                          if (item.separatorBefore == true)
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    $constants.insets.sm,
                                              ),
                                              child: Divider(
                                                color: Colors.grey.shade300,
                                                thickness: 2,
                                              ),
                                            ),
                                          GestureDetector(
                                            onTap: () {
                                              if (item.onTap != null) {
                                                item.onTap!(0);
                                                return;
                                              }
                                              context
                                                  .read<AppCubit>()
                                                  .changePrimaryMenuSelectedKey(
                                                    key: (item.key as ValueKey)
                                                        .value,
                                                  );
                                              if (item.mainSecondaryKey !=
                                                  null) {
                                                context
                                                    .read<AppCubit>()
                                                    .changeSecondaryMenuSelectedKey(
                                                      key: item
                                                          .mainSecondaryKey!,
                                                    );
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      $constants.insets.sm),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: appState
                                                                      .primaryMenuSelectedKey ==
                                                                  (item.key
                                                                          as ValueKey)
                                                                      .value
                                                              ? Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500,
                                                                  width: 1,
                                                                )
                                                              : null,
                                                          color: item.color !=
                                                                  null
                                                              ? item.color!
                                                                  .withValues(
                                                                      alpha:
                                                                          0.1)
                                                              : Colors
                                                                  .grey.shade500
                                                                  .withValues(
                                                                      alpha:
                                                                          0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      $constants
                                                                          .corners
                                                                          .lg),
                                                        ),
                                                        child: item.initialsOnly ==
                                                                true
                                                            ? Center(
                                                                child: Text(
                                                                  _getInitials(
                                                                      item.label),
                                                                  style: getTextTheme(
                                                                          context)
                                                                      .bodyLarge!
                                                                      .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: item.color !=
                                                                                null
                                                                            ? item.color!
                                                                            : Colors.grey.shade800,
                                                                      ),
                                                                ),
                                                              )
                                                            : IconTheme(
                                                                data:
                                                                    IconThemeData(
                                                                  color: item.color !=
                                                                          null
                                                                      ? item
                                                                          .color!
                                                                      : Colors
                                                                          .grey
                                                                          .shade800,
                                                                ),
                                                                child: isApple(
                                                                        context)
                                                                    ? item
                                                                        .cupertinoIcon
                                                                    : item
                                                                        .icon),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: $constants.insets.sm,
                                                  ),
                                                  Text(item.label)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      // secodary menu items
                      if (secondarySection != null &&
                          secondarySection.items.isNotEmpty)
                        SizedBox(
                          width: 80,
                          child: SideMenu(
                            controller: _secondarySideMenuController,
                            minWidth: getSize(context).width * 0.08,
                            hasResizer: false,
                            hasResizerToggle: false,
                            builder: (data) {
                              return SideMenuData(
                                customChild: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: $constants.insets.sm,
                                      ),
                                      ...secondarySection.items.map((item) =>
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (item.separatorBefore != true)
                                                SizedBox(
                                                  height: $constants.insets.xxs,
                                                ),
                                              if (item.separatorBefore == true)
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        $constants.insets.sm,
                                                  ),
                                                  child: Divider(
                                                    color: Colors.grey.shade300,
                                                    thickness: 2,
                                                  ),
                                                ),
                                              GestureDetector(
                                                onTap: () {
                                                  if (item.onTap != null) {
                                                    item.onTap!(0);
                                                  } else {
                                                    context
                                                        .read<AppCubit>()
                                                        .changeSecondaryMenuSelectedKey(
                                                          key: (item.key
                                                                  as ValueKey)
                                                              .value,
                                                        );
                                                  }
                                                  if (!isDesktop(context)) {
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        border: appState
                                                                    .secondaryMenuSelectedKey ==
                                                                (item.key
                                                                        as ValueKey)
                                                                    .value
                                                            ? Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .shade500,
                                                                width: 1,
                                                              )
                                                            : null,
                                                        color: item.color !=
                                                                null
                                                            ? item.color!
                                                                .withValues(
                                                                    alpha: 0.1)
                                                            : Colors
                                                                .grey.shade500
                                                                .withValues(
                                                                    alpha: 0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    $constants
                                                                        .corners
                                                                        .lg),
                                                      ),
                                                      child: item.initialsOnly ==
                                                              true
                                                          ? Center(
                                                              child: Text(
                                                                _getInitials(
                                                                    item.label),
                                                                style: getTextTheme(
                                                                        context)
                                                                    .bodyLarge!
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: item.color !=
                                                                              null
                                                                          ? item
                                                                              .color!
                                                                          : Colors
                                                                              .grey
                                                                              .shade800,
                                                                    ),
                                                              ),
                                                            )
                                                          : IconTheme(
                                                              data:
                                                                  IconThemeData(
                                                                color: item.color !=
                                                                        null
                                                                    ? item
                                                                        .color!
                                                                    : Colors
                                                                        .grey
                                                                        .shade800,
                                                              ),
                                                              child: isApple(
                                                                      context)
                                                                  ? item
                                                                      .cupertinoIcon
                                                                  : item.icon),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
            return renderedBody;
          });
        });
      },
    );
  }

  _runAppInitAndChecks({
    required BuildContext context,
    required AppState appState,
    required AuthState authState,
  }) {
    if (authState is LoggedIn) {
      encryptionService ??=
          EncryptionService(userSalt: authState.user!.keySet.salt);
      encryptionService!.hydrateKey();
    }

    // if the user is logged out, show the login modal
    if (authState is LoggedOut && !_isLoginModalVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showLoginModal(context);
      });
    }
  }

  void _showLoginModal(BuildContext context) {
    if (kIsWeb || Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
                child: LoginOrRegisterModal(
                  onAuthSuccess: () => setState(() {
                    _isLoginModalVisible = false;
                  }),
                ),
              ));
    } else {
      showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (context) => LoginOrRegisterModal(
          onAuthSuccess: () => setState(() {
            _isLoginModalVisible = false;
          }),
        ),
      );
    }
    setState(() {
      _isLoginModalVisible = true;
    });
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '';

    return name
        .trim()
        .split(' ')
        .where((word) => word.isNotEmpty)
        .take(3)
        .map((word) => word[0].toUpperCase())
        .join();
  }
}
