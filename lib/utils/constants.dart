import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/buttons/account_avatar_with_sync_status.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:app/pages/calendar/calendar.dart';
import 'package:app/pages/habits/habits.dart';
import 'package:app/pages/more_apps/more_apps.dart';
import 'package:app/pages/today/add_task_modal.dart';
import 'package:app/pages/today/today.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

final $constants = Constants();

@immutable
class Constants {
  late final Corners corners = Corners();
  late final Insets insets = Insets();
  late final Palette palette = Palette();
  late final Navigation navigation = Navigation();
  late final Ads ads = Ads();
}

@immutable
class Corners {
  late final double none = 0;
  late final double xxs = 2;
  late final double xs = 4;
  late final double sm = 8;
  late final double md = 12;
  late final double lg = 16;
  late final double xl = 28;
  late final double xxl = 36;
  late final double full = 1000;
}

@immutable
class Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

@immutable
class Palette {
  final white = const Color(0xFFFFFFFF);
  final black = const Color(0xFF000000);
  final grey = const Color(0xFF9E9E9E);
  final red = const Color(0xFFFF0000);
  final orange = const Color(0xFFFF8000);
  final yellow = const Color(0xFFFCCC1A);
  final green = const Color(0xFF66B032);
  final cyan = const Color(0xFF00FFFF);
  final blue = const Color(0xFF0000FF);
  final purple = const Color(0xFF0080FF);
  final magenta = const Color(0xFFFF00FF);
}

@immutable
class Ads {
  final _ads = {};

  getAd(String adName, String? platform) {
    if (!['ios', 'android'].contains(platform)) {
      throw Exception('invalid_ad_platform');
    }
    if (env?.env == "prod") {
      return _ads[adName]?[platform];
    } else {
      return "ca-app-pub-3940256099942544/5224354917";
    }
  }
}

@immutable
class Navigation {
  /// Appbar configuration.
  List<AppBar?> appbars(BuildContext context, {Widget? leading}) => [
        AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.t.today.title,
                style: getTextTheme(context).headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: $constants.insets.sm),
              child: const AccountAvatarWithSyncStatus(),
            )
          ],
        ),
        AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.t.calendar.title,
                  style: getTextTheme(context).headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            actions: [
              BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                if (authState is LoggedIn) {
                  return Padding(
                    padding: EdgeInsets.only(right: $constants.insets.sm),
                    child: const AccountAvatarWithSyncStatus(),
                  );
                }
                return Container();
              })
            ]),
        null,
        AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.t.habits.title,
                  style: getTextTheme(context).headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            actions: [
              BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                if (authState is LoggedIn) {
                  return Padding(
                    padding: EdgeInsets.only(right: $constants.insets.sm),
                    child: const AccountAvatarWithSyncStatus(),
                  );
                }
                return Container();
              })
            ]),
        AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.t.more.title,
                  style: getTextTheme(context).headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            actions: [
              BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                if (authState is LoggedIn) {
                  return Padding(
                    padding: EdgeInsets.only(right: $constants.insets.sm),
                    child: const AccountAvatarWithSyncStatus(),
                  );
                }
                return Container();
              })
            ]),
      ];

  /// Bottom navigation configuration.
  List<Widget?> bottomNavigationScreens() => [
        const Tasks(),
        const Calendar(),
        null,
        const Habits(),
        const MoreApps(),
      ];

  List<Widget?> floatingActionButtons(BuildContext context) => [
        FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const AddTaskModal());
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular($constants.corners.xxl),
          ),
          elevation: 1,
          backgroundColor: getTheme(context).surfaceContainerHighest,
          child: const Icon(LineAwesome.plus_solid),
        ),
        null,
        null,
        null,
        null
      ];

  List<Widget> bottomNavigationItems(BuildContext context) => [
        BottomNavigationItem(
          key: const Key("today"),
          icon: const Icon(
            LineAwesome.home_solid,
            size: 25,
          ),
          cupertinoIcon: const Icon(
            CupertinoIcons.house_fill,
            size: 25,
          ),
          label: context.t.today.title,
        ),
        BottomNavigationItem(
          key: const Key("calendar"),
          icon: const Icon(
            LineAwesome.calendar,
            size: 25,
          ),
          cupertinoIcon: const Icon(
            CupertinoIcons.calendar,
            size: 25,
          ),
          label: context.t.calendar.title,
        ),
        BottomNavigationItem(
          icon: Icon(
            LineAwesome.plus_solid,
            color: getTheme(context).primary,
          ),
          cupertinoIcon: Icon(
            CupertinoIcons.plus_circle_fill,
            color: getTheme(context).secondary,
          ),
          label: "Add",
          onTap: (index) {
            print("pressed");
          },
        ),
        BottomNavigationItem(
          key: const Key("habits"),
          icon: const Icon(
            LineAwesome.bolt_solid,
            size: 25,
          ),
          cupertinoIcon: const Icon(
            CupertinoIcons.bolt_fill,
            size: 25,
          ),
          label: context.t.habits.title,
        ),
        BottomNavigationItem(
          key: const Key("more"),
          icon: const Icon(
            CupertinoIcons.ellipsis_circle_fill,
            size: 25,
          ),
          cupertinoIcon: const Icon(
            CupertinoIcons.ellipsis_circle_fill,
            size: 25,
          ),
          label: context.t.more.title,
        ),
      ];
}
