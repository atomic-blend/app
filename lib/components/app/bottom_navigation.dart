import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A customizable bottom navigation item for use with [BottomNavigation].
///
/// This widget wraps the Material [NavigationDestination] to provide additional
/// functionality like an optional onTap callback for individual items.
class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.onTap,
    this.tooltip,
    this.enabled = true,
  });

  /// The icon displayed by the destination.
  final Widget icon;

  /// The optional icon to display when this destination is selected.
  final Widget? selectedIcon;

  /// The label displayed by the destination.
  final String label;

  /// Optional tooltip for the destination.
  final String? tooltip;

  /// Whether this destination is interactive.
  final bool enabled;

  /// Optional callback invoked when this item is tapped.
  ///
  /// The callback provides the index of the item in the navigation bar.
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: icon,
      selectedIcon: selectedIcon,
      label: label,
      tooltip: tooltip,
      enabled: enabled,
    );
  }
}

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
    // Create a modified destinations list with Add button in the middle
    return NavigationBar(
      height: 60,
      indicatorColor: getTheme(context).primaryContainer,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (index) {
        // Check if the tapped item has its own onTap handler
        if (destinations.length > index &&
            destinations[index] is BottomNavigationItem &&
            (destinations[index] as BottomNavigationItem).onTap != null) {
          (destinations[index] as BottomNavigationItem).onTap!(index);
        }
        // Otherwise use the default handler
        else if (onTap != null) {
          onTap!(index);
        } else {
          context.read<AppCubit>().changePageIndex(index: index);
        }
      },
      destinations: destinations,
    );
  }
}
