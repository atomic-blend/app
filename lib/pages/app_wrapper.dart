import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/widgets/not_logged_in.dart';
import 'package:app/pages/auth/not_logged_in.dart';
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
        return Scaffold(
            floatingActionButton: state.user != null
                ? floattingActionsButtons.elementAt(appState.pageIndex)
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: getTheme(context).surface,
            appBar: appbars.elementAt(appState.pageIndex),
            body: state.runtimeType == LoggedOut
                ? const Center(child: NotLoggedInWidget())
                : body,
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
