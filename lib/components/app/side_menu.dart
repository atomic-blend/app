import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/components/app/side_menu_item.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatefulWidget {
  final List<SideMenuItem> items;
  final double? paddingTop;
  const SideMenu({super.key, required this.items, this.paddingTop});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      var items = [];

      widget.items.forEachIndexed((index, element) {
        if (index == appState.selectedTabIndex) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
        items.add(Padding(
          padding: EdgeInsets.only(bottom: $constants.insets.xs),
          child: element,
        ));
      });

      return Container(
        decoration: BoxDecoration(color: getTheme(context).surface),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: widget.paddingTop ?? getSize(context).height * 0.09),
              ...items,
            ],
          ),
        ),
      );
    });
  }
}
