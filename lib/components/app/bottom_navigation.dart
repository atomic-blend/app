import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.destinations,
    required this.currentPageIndex,
    this.onTap,
  });

  final List<Widget> destinations;
  final int currentPageIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 60,
      indicatorColor: getTheme(context).primaryContainer,
      selectedIndex: currentPageIndex,
      onDestinationSelected: onTap ??
          (index) => context.read<AppCubit>().changePageIndex(index: index),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: destinations,
    );
  }
}
