import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/app/side_menu.dart';
import 'package:app/pages/auth/login_or_register_modal.dart';
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
      // if (appState.isIntroCompleted != true) {
      //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => const AppIntroduction()));
      //   });
      // }
      return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is LoggedIn) {
          encryptionService ??=
              EncryptionService(userSalt: state.user!.keySalt);
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
            AnimatedContainer(
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
              ),
            ),
          ],
        );
      });
    });
  }
}
