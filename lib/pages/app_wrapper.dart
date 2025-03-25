import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/app/side_menu.dart';
import 'package:app/pages/auth/login_or_register_modal.dart';
import 'package:app/services/device_info.service.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool _isLoginModalVisible = false;
  bool _isSideMenuOpened = false;
  final double _sideMenuWidth = 60;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // context.read<AuthBloc>().add(const RefreshUser());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is LoggedIn) {
          encryptionService ??=
              EncryptionService(userSalt: state.user!.keySet.salt);
          encryptionService!.hydrateKey();

          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (state.user!.devices == null) {
              state.user!.devices = [];
            }
            deviceInfoService ??= DeviceInfoService();
            final userDeviceInfo = await deviceInfoService!.getDeviceInfo();
            if (state.user!.devices!.every(
                (device) => device.deviceId != userDeviceInfo.deviceId)) {
              state.user!.devices!.add(userDeviceInfo);
              if (!context.mounted) return;
              context.read<AuthBloc>().add(
                    UpdateUserDevice(
                      state.user!,
                      userDeviceInfo,
                    ),
                  );
            }
          });
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
            setState(() {
              _isLoginModalVisible = true;
            });
          });
        }
        final appBarconfig = appbars.elementAt(appState.pageIndex);
        final appBar = AppBar(
          title: appBarconfig!.title,
          actions: appBarconfig.actions,
          leading: IconButton(
            icon: appState.pageIndex == appbars.length - 1
                ? Container()
                : const Icon(Icons.menu),
            onPressed: () {
              setState(() {
                _isSideMenuOpened = !_isSideMenuOpened;
              });
            },
          ),
        );

        return Stack(
          children: [
            // Main content
            GestureDetector(
              onHorizontalDragEnd: (details) {
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
                    destinations: navItems,
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
              AnimatedContainer(
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
          ],
        );
      });
    });
  }
}
