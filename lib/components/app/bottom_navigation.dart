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
    this.onAddPressed,
  });

  final List<Widget> destinations;
  final int currentPageIndex;
  final Function(int)? onTap;
  final VoidCallback? onAddPressed;

  @override
  Widget build(BuildContext context) {
    // Create a modified destinations list with Add button in the middle
    final int middleIndex = destinations.length ~/ 2;
    final List<Widget> modifiedDestinations = List.from(destinations);

    // Insert the Add button in the middle
    modifiedDestinations.insert(
      middleIndex,
      NavigationDestination(
        icon: GestureDetector(
            onTap: () {
              print("pressed");
            },
            child: const Icon(Icons.add)),
        label: 'Add',
      ),
    );

    return NavigationBar(
      height: 60,
      indicatorColor: getTheme(context).primaryContainer,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (index) {
        // Adjust index if it's after the add button
        final int adjustedIndex = index > middleIndex ? index - 1 : index;

        // Skip processing if it's the add button
        if (index == middleIndex) {
          return;
        }

        if (onTap != null) {
          onTap!(adjustedIndex);
        } else {
          context.read<AppCubit>().changePageIndex(index: adjustedIndex);
        }
      },
      destinations: modifiedDestinations,
    );
  }
}
