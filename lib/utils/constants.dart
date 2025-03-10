import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/sync_status_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:app/pages/more_apps/more_apps.dart';
import 'package:app/pages/tasks/add_task_modal.dart';
import 'package:app/pages/tasks/tasks.dart';
import 'package:app/utils/shortcuts.dart';
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
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 64;
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
  List<AppBar?> appbars(BuildContext context) => [
        AppBar(
          title: Row(
            children: [
              Text(
                context.t.tasks.title,
                style: getTextTheme(context).titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: $constants.insets.sm),
              child: const SyncStatusButton(),
            )
          ],
        ),
        AppBar(
            title: Row(
              children: [
                Text(
                  context.t.more.title,
                  style: getTextTheme(context).titleLarge!.copyWith(
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
                    child: const SyncStatusButton(),
                  );
                }
                return Container();
              })
            ]),
      ];

  /// Bottom navigation configuration.
  List<Widget> bottomNavigationScreens() => [
        const Tasks(),
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
        null
      ];

  List<NavigationDestination> bottomNavigationItems(BuildContext context) => [
        const NavigationDestination(
          key: Key("tasks"),
          icon: Icon(
            LineAwesome.check_circle,
            size: 25,
          ),
          label: "tasks",
        ),
        const NavigationDestination(
          key: Key("more"),
          icon: Icon(
            LineAwesome.ellipsis_h_solid,
            size: 25,
          ),
          label: "more",
        ),
      ];
}
