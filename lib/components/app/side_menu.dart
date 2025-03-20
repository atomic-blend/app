import 'package:app/components/app/side_menu_item.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(color: getTheme(context).surface),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: widget.paddingTop ?? getSize(context).height * 0.09),
            ...widget.items.map((item) {
              return Padding(
                padding: EdgeInsets.only(bottom: $constants.insets.xs),
                child: item,
              );
            }),
          ],
        ),
      ),
    );
  }
}
