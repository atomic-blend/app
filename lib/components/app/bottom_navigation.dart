import 'dart:io';

import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A customizable bottom navigation item for use with [BottomNavigation].
///
/// This widget wraps the Material [NavigationDestination] to provide additional
/// functionality like an optional onTap callback for individual items.
class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.cupertinoIcon,
    required this.label,
    this.selectedIcon,
    this.onTap,
    this.tooltip,
    this.enabled = true,
    this.body,
    this.initialsOnly,
    this.appBar,
    this.mainSecondaryKey,
    this.color,
    this.separatorBefore,
  });

  /// The icon displayed by the destination.
  final Widget icon;

  /// The Cupertino icon displayed by the destination.
  final Widget cupertinoIcon;

  /// The optional icon to display when this destination is selected.
  final Widget? selectedIcon;

  /// The label displayed by the destination.
  final String label;

  /// Optional tooltip for the destination.
  final String? tooltip;

  /// Optional body
  final Widget? body;

  /// Optional appbar
  final AppBar? appBar;

  /// Optional separatorBefore
  final bool? separatorBefore;

  /// Main secondary key (the default secondary screen)
  final String? mainSecondaryKey;

  /// Optional color
  final Color? color;

  /// Whether to show only initials in the destination.
  final bool? initialsOnly;

  /// Whether this destination is interactive.
  final bool enabled;

  /// Optional callback invoked when this item is tapped.
  ///
  /// The callback provides the index of the item in the navigation bar.
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    // Use the appropriate icon based on platform
    final Widget platformIcon =
        Platform.isIOS || Platform.isMacOS ? cupertinoIcon : icon;

    return NavigationDestination(
      icon: platformIcon,
      selectedIcon: selectedIcon,
      label: label,
      tooltip: tooltip,
      enabled: enabled,
    );
  }
}

class NavigationSection {
  const NavigationSection({
    required this.key,
    required this.items,
  });

  /// The key of the section.
  final Key key;

  /// The list of items in the section.
  final List<NavigationItem> items;
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.destinations,
    required this.primaryMenuKey,
    this.backgroundColor,
    this.onTap,
  });

  final List<Widget> destinations;
  final String primaryMenuKey;
  final Color? backgroundColor;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    // Check platform and return appropriate navigation bar
    if (Platform.isIOS || Platform.isMacOS) {
      // Convert destinations to BottomNavigationBarItems for Cupertino
      final cupertinoItems = destinations.map((dest) {
        if (dest is NavigationItem) {
          return BottomNavigationBarItem(
            icon: dest.cupertinoIcon,
            activeIcon: dest.selectedIcon ?? dest.cupertinoIcon,
            label: dest.label,
          );
        }
        // Fallback for other widget types
        return const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.circle),
          label: '',
        );
      }).toList();

      return CupertinoTabBar(
        backgroundColor: backgroundColor,
        currentIndex: destinations.indexWhere((element) =>
            element is NavigationItem &&
            (element.key as ValueKey).value == primaryMenuKey),
        onTap: (index) {
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
            context.read<AppCubit>().changePrimaryMenuSelectedKey(
                key: (destinations[index].key as ValueKey).value);
            if (destinations[index] is NavigationItem &&
                (destinations[index] as NavigationItem).mainSecondaryKey !=
                    null) {
              context.read<AppCubit>().changeSecondaryMenuSelectedKey(
                  key: (destinations[index] as NavigationItem)
                      .mainSecondaryKey!);
            }
          }
        },
        items: cupertinoItems,
      );
    }

    // For other platforms, use the Material NavigationBar
    return NavigationBar(
      height: 60,
      indicatorColor: getTheme(context).primaryContainer,
      selectedIndex: destinations.indexWhere((element) =>
          element is NavigationItem &&
          (element.key as ValueKey).value == primaryMenuKey),
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
          context.read<AppCubit>().changePrimaryMenuSelectedKey(
              key: (destinations[index].key as ValueKey).value);
        }
      },
      destinations: destinations,
    );
  }
}
