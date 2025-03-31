import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/components/app/side_menu_item.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatelessWidget {
  final List<SideMenuItem> items;
  final VoidCallback? onItemSelected;
  final double? paddingTop;

  const SideMenu({
    super.key,
    required this.items,
    this.onItemSelected,
    this.paddingTop,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      var sideItems = [];
      items.forEachIndexed((index, element) {
        if (index == appState.selectedTabIndex) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
        sideItems.add(Padding(
          padding: EdgeInsets.only(
              bottom: $constants.insets.xs, right: $constants.insets.xs),
          child: GestureDetector(
            onTap: () {
              if (onItemSelected != null) {
                onItemSelected!();
              }
              element.onTap();
            },
            child: element,
          ),
        ));
      });

      return Container(
        decoration: BoxDecoration(color: getTheme(context).surface),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: paddingTop ?? getSize(context).height * 0.09),
              ...sideItems,
            ],
          ),
        ),
      );
    });
  }
}
