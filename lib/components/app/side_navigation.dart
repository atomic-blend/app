import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation(
      {super.key,
      required this.destinations,
      required this.currentPageIndex,
      this.backgroundColor,
      this.onTap});

  final List<Widget> destinations;
  final int currentPageIndex;
  final Color? backgroundColor;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: destinations.map((dest) {
        if (dest is NavigationItem) {
          return NavigationRailDestination(
            icon: dest.icon,
            selectedIcon: dest.selectedIcon,
            label: Text(dest.label),
          );
        } else {
          throw Exception('Invalid destination type');
        }
      }).toList(),
      selectedIndex: currentPageIndex,
      backgroundColor: backgroundColor,
      onDestinationSelected: (index) {
        // Check if the tapped item has its own onTap handler
        if (destinations.length > index &&
            destinations[index] is NavigationItem &&
            (destinations[index] as NavigationItem).onTap != null) {
          (destinations[index] as NavigationItem).onTap!(index);
        }
        // Otherwise use the default handler
        else if (onTap != null) {
          onTap!(index);
        } else {
          context.read<AppCubit>().changePageIndex(index: index);
        }
      },
    );
  }
}
