import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/account/account.dart';
import 'package:app/pages/settings/settings.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoreApps extends StatefulWidget {
  const MoreApps({super.key});

  @override
  State<MoreApps> createState() => _MoreAppsState();
}

class _MoreAppsState extends State<MoreApps> {
  @override
  Widget build(BuildContext context) {
    final restOfNavigation =
        $constants.navigation.primaryMenuItems(context).sublist(5);
    return SafeArea(
      child: Padding(
        padding: isDesktop(context)
            ? EdgeInsets.only(
                right: $constants.insets.md,
                left: $constants.insets.sm,
                bottom: $constants.insets.sm,
              )
            : EdgeInsets.only(
                right: $constants.insets.sm,
                left: $constants.insets.sm,
                bottom: $constants.insets.sm,
              ),
        child: Column(
          children: [
            if (!isDesktop(context) && restOfNavigation.isNotEmpty) ...[
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: $constants.insets.sm,
                crossAxisSpacing: $constants.insets.sm,
                children: restOfNavigation.map((e) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 0.6,
                    child: GestureDetector(
                      onTap: () {
                        if (e.onTap != null) {
                          e.onTap!(0);
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => e.body ?? Container(),
                          ),
                        );
                      },
                      child: ElevatedContainer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: $constants.insets.sm,
                            ),
                            isDesktop(context) ? e.icon : e.cupertinoIcon,
                            SizedBox(
                              height: $constants.insets.xxs,
                            ),
                            Text(
                              e.label,
                              style: getTextTheme(context).labelMedium,
                            ),
                            SizedBox(
                              height: $constants.insets.sm,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop(context) ? $constants.insets.lg : 0,
                  vertical: isDesktop(context)
                      ? $constants.insets.lg
                      : $constants.insets.sm,
                ),
                child: Column(
                  children: [
                    ElevatedContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                        vertical: $constants.insets.sm,
                      ),
                      child: IconTextButton(
                        text: context.t.account.sections.account,
                        icon: CupertinoIcons.person,
                        iconSize: 25,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const Account(),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: isDesktop(context)
                          ? $constants.insets.md
                          : $constants.insets.sm,
                    ),
                    ElevatedContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                        vertical: $constants.insets.sm,
                      ),
                      child: IconTextButton(
                        text: context.t.settings.title,
                        icon: CupertinoIcons.gear,
                        iconSize: 25,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Settings()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
