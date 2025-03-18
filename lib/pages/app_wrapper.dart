import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/pages/auth/login_or_register_modal.dart';
import 'package:app/pages/auth/welcome_screen.dart';
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
        var navItems = $constants.navigation.bottomNavigationItems(context);
        var screens = $constants.navigation.bottomNavigationScreens();
        var floattingActionsButtons =
            $constants.navigation.floatingActionButtons(context);
        late Widget body;
        var appbars = $constants.navigation.appbars(context);
        body = screens.elementAt(appState.pageIndex);
        if (state is Loading) {
          body = const Center(child: CircularProgressIndicator());
        }
        if (state is LoggedOut && !_isLoginModalVisible) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showModalBottomSheet(
              isDismissible: false,
              isScrollControlled: true,
              context: context,
              builder: (context) => const LoginOrRegisterModal(),
            );
            setState(() {
              _isLoginModalVisible = true;
            });
          });
        }
        return Scaffold(
            floatingActionButton: state.user != null
                ? floattingActionsButtons.elementAt(appState.pageIndex)
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: getTheme(context).surface,
            appBar: appbars.elementAt(appState.pageIndex),
            body: body,
            bottomNavigationBar: BottomNavigation(
              destinations: navItems,
              currentPageIndex: appState.pageIndex,
              onTap: (index) {
                context.read<AppCubit>().changePageIndex(index: index);
              },
            ));
      });
    });
  }
}
