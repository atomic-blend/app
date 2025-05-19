import 'dart:io';

import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/app/side_menu.dart';
import 'package:app/components/app/side_menu_item.dart';
import 'package:app/components/app/side_navigation.dart';
import 'package:app/components/buttons/account_avatar_with_sync_status.dart';
import 'package:app/components/responsive_stateful_widget.dart';
import 'package:app/pages/auth/login_or_register_modal.dart';
import 'package:app/services/device_info.service.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_window_utils/widgets/titlebar_safe_area.dart';

class AppWrapper extends ResponsiveStatefulWidget {
  const AppWrapper({super.key});

  @override
  AppWrapperState createState() => AppWrapperState();
}

class AppWrapperState extends ResponsiveState<AppWrapper> {
  bool _isLoginModalVisible = false;
  bool _isSideMenuOpened = false;
  final double _sideMenuWidth = 60;

  @override
  void initState() {
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
    return _buildAppStructure(context, isMobile: true);
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return _buildAppStructure(context, isMobile: false);
  }

  Widget _buildAppStructure(BuildContext context, {required bool isMobile}) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is LoggedIn) {
          encryptionService ??=
              EncryptionService(userSalt: state.user!.keySet.salt);
          encryptionService!.hydrateKey();
        }
        var navItems = $constants.navigation.bottomNavigationItems(context);
        var screens = $constants.navigation.bottomNavigationScreens();
        var floattingActionsButtons =
            $constants.navigation.floatingActionButtons(context);
        late Widget? body;
        var appbars = $constants.navigation.appbars(context);
        body = screens.elementAt(appState.pageIndex);
        var menuItems = $constants.navigation.sideMenuItems(context);
        if (menuItems.isNotEmpty && menuItems[appState.pageIndex] != null) {
          body = menuItems[appState.pageIndex]![appState.selectedTabIndex].body;
        }
        if (state is Loading) {
          body = const Center(child: CircularProgressIndicator());
        }
        if (state is LoggedOut && !_isLoginModalVisible) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showLoginModal(context);
          });
        }

        if (isMobile) {
          return _buildMobileLayout(
            context: context,
            appState: appState,
            state: state,
            navItems: navItems,
            floattingActionsButtons: floattingActionsButtons,
            appbars: appbars,
            menuItems: menuItems,
            body: body,
          );
        } else {
          if (screens.length > 5) {
            var moreScreen = screens.removeAt(4);
            screens.add(moreScreen);
          }
          return _buildDesktopLayout(
            context: context,
            appState: appState,
            state: state,
            appbars: appbars,
            navItems: navItems,
            floattingActionsButtons: floattingActionsButtons,
            menuItems: menuItems,
            body: screens[appState.pageIndex],
          );
        }
      });
    });
  }

  Widget _buildMobileLayout({
    required BuildContext context,
    required AppState appState,
    required AuthState state,
    required List<Widget> navItems,
    required List<Widget?> floattingActionsButtons,
    required List<AppBar?> appbars,
    required List<List<SideMenuItem>?> menuItems,
    required Widget? body,
  }) {
    final appBarconfig = appbars.elementAt(appState.pageIndex);
    final appBar = AppBar(
      backgroundColor: getTheme(context).surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: appBarconfig!.title,
      actions: appBarconfig.actions,
      leading: menuItems[appState.pageIndex] != null &&
              menuItems[appState.pageIndex]?.isNotEmpty == true
          ? IconButton(
              icon: appState.pageIndex == appbars.length - 1
                  ? Container()
                  : const Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  _isSideMenuOpened = !_isSideMenuOpened;
                });
              },
            )
          : Container(),
    );

    return Stack(
      children: [
        // Main content
        GestureDetector(
          onHorizontalDragEnd: (details) {
            // Ensure we have a velocity (avoid null issues)
            if (details.primaryVelocity == null) return;

            // Right swipe to open menu
            if (details.primaryVelocity! > 0 && !_isSideMenuOpened) {
              setState(() {
                _isSideMenuOpened = true;
              });
            }
            // Left swipe to close menu
            else if (details.primaryVelocity! < 0 && _isSideMenuOpened) {
              setState(() {
                _isSideMenuOpened = false;
              });
            }
          },
          // Add onHorizontalDragUpdate to detect smaller swipes
          onHorizontalDragUpdate: (details) {
            if (_isSideMenuOpened && details.delta.dx < -10) {
              setState(() {
                _isSideMenuOpened = false;
              });
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(
                _isSideMenuOpened ? _sideMenuWidth : 0, 0, 0),
            child: Scaffold(
              floatingActionButton: state.user != null
                  ? floattingActionsButtons.elementAt(appState.pageIndex)
                  : null,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              backgroundColor: getTheme(context).surface,
              appBar: appBar,
              body: body!,
              bottomNavigationBar: BottomNavigation(
                destinations: navItems.take(5).toList(),
                currentPageIndex: appState.pageIndex,
                onTap: (index) {
                  context.read<AppCubit>().changePageIndex(index: index);
                },
              ),
            ),
          ),
        ),

        // Overlay to detect taps outside the menu (only visible when menu is open)
        if (_isSideMenuOpened)
          Positioned.fill(
            left: _sideMenuWidth,
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                // Left swipe to close menu
                if (details.primaryVelocity != null &&
                    details.primaryVelocity! < 0) {
                  setState(() {
                    _isSideMenuOpened = false;
                  });
                }
              },
              onHorizontalDragUpdate: (details) {
                // Close on smaller left drags too
                if (details.delta.dx < -10) {
                  setState(() {
                    _isSideMenuOpened = false;
                  });
                }
              },
              onTap: () {
                setState(() {
                  _isSideMenuOpened = false;
                });
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),

        // Side menu
        if (menuItems[appState.pageIndex] != null)
          GestureDetector(
            onHorizontalDragEnd: (details) {
              // Left swipe to close menu
              if (details.primaryVelocity != null &&
                  details.primaryVelocity! < 0) {
                setState(() {
                  _isSideMenuOpened = false;
                });
              }
            },
            onHorizontalDragUpdate: (details) {
              // Close on smaller left drags too
              if (details.delta.dx < -10) {
                setState(() {
                  _isSideMenuOpened = false;
                });
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: _sideMenuWidth,
              transform: Matrix4.translationValues(
                  _isSideMenuOpened ? 0 : -_sideMenuWidth, 0, 0),
              child: SideMenu(
                items: menuItems[appState.pageIndex]!,
                onItemSelected: () {
                  debugPrint('Side menu item selected - closing menu');
                  setState(() {
                    _isSideMenuOpened = false;
                  });
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDesktopLayout({
    required BuildContext context,
    required AppState appState,
    required AuthState state,
    required List<AppBar?> appbars,
    required List<Widget> navItems,
    required List<Widget?> floattingActionsButtons,
    required List<List<SideMenuItem>?> menuItems,
    required Widget? body,
  }) {
    final appBarconfig = appbars.elementAt(appState.pageIndex);
    final appBar = AppBar(
      backgroundColor: getTheme(context).surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: appBarconfig?.title,
      actions: appBarconfig?.actions,
    );
    // move the more screen at the end
    var bodyToReturn = SafeArea(
      child: Container(
        color: getTheme(context).surface,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: getTheme(context).surfaceContainerLow,
                borderRadius: BorderRadius.circular($constants.corners.sm),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: $constants.insets.xxs,
                ),
                child: Column(
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, authState) {
                      if (authState is LoggedIn && isDesktop(context)) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: $constants.insets.sm,
                              bottom: $constants.insets.sm),
                          child: const AccountAvatarWithSyncStatus(
                            avatarSize: 35,
                          ),
                        );
                      }
                      return Container();
                    }),
                    Expanded(
                      child: SideNavigation(
                        backgroundColor: Colors.transparent,
                        destinations: navItems,
                        currentPageIndex: appState.pageIndex,
                        onTap: (index) {
                          context
                              .read<AppCubit>()
                              .changePageIndex(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  if ((menuItems[appState.pageIndex] ?? []).isNotEmpty) ...[
                    Container(
                        width: 150,
                        padding: EdgeInsets.only(left: $constants.insets.xxs),
                        child: SideMenu(
                          paddingTop: $constants.insets.sm,
                          items: menuItems[appState.pageIndex] ?? [],
                          displayLabel: true,
                        )),
                    const VerticalDivider(),
                  ],
                  Expanded(
                    child: Scaffold(
                      floatingActionButton: state.user != null
                          ? floattingActionsButtons
                              .elementAt(appState.pageIndex)
                          : null,
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.endFloat,
                      backgroundColor: getTheme(context).surface,
                      appBar: appBar,
                      body: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                        ),
                        child: body ?? Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    if (!kIsWeb && Platform.isMacOS) {
      return TitlebarSafeArea(
        child: bodyToReturn,
      );
    }
    return bodyToReturn;
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
}
