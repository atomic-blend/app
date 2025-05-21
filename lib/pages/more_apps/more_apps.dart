import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/account/account.dart';
import 'package:app/pages/eiseinhower/eisenhower.dart';
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
        $constants.navigation.bottomNavigationItems(context).sublist(5);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            if (!isDesktop(context) && restOfNavigation.isNotEmpty) ...[
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: $constants.insets.sm,
                crossAxisSpacing: $constants.insets.sm,
                children: restOfNavigation.map((e) {
                  if (e is NavigationItem) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EisenhowerMatrix(),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: getTheme(context).surfaceContainer,
                          borderRadius:
                              BorderRadius.circular($constants.insets.sm),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.square_grid_2x2_fill,
                              size: 35,
                            ),
                            SizedBox(
                              height: $constants.insets.xxs,
                            ),
                            Text(
                              e.label,
                              style: getTextTheme(context).labelMedium,
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                }).toList(),
              ),
              SizedBox(
                height: $constants.insets.md,
              )
            ],
            IconTextButton(
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
            SizedBox(
              height: $constants.insets.sm,
            ),
            IconTextButton(
              text: context.t.settings.title,
              icon: CupertinoIcons.gear,
              iconSize: 25,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
