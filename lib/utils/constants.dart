import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/app/bottom_navigation.dart';
import 'package:app/components/buttons/account_avatar_with_sync_status.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:app/pages/calendar/calendar.dart';
import 'package:app/pages/calendar/calendar_settings.dart';
import 'package:app/pages/habits/add_habits_modal.dart';
import 'package:app/pages/habits/habits.dart';
import 'package:app/pages/more_apps/more_apps.dart';
import 'package:app/pages/tasks/add_task_modal.dart';
import 'package:app/pages/tasks/filtered_view.dart';
import 'package:app/pages/tasks/folders.dart';
import 'package:app/pages/tasks/overview.dart';
import 'package:app/pages/tasks/tags.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../pages/eiseinhower/eisenhower.dart';

final $constants = Constants();

@immutable
class Constants {
  late final Corners corners = Corners();
  late final Insets insets = Insets();
  late final Palette palette = Palette();
  late final Navigation navigation = Navigation();
  late final ScreenSize screenSize = ScreenSize();
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
class ScreenSize {
  final double sm = 600;
  final double md = 900;
  final double lg = 1200;
  final double xl = 1536;
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
  List<NavigationSection> secondaryMenuSections(BuildContext context) => [
        NavigationSection(
          key: const Key("tasks"),
          items: [
            NavigationItem(
              key: const Key("overview"),
              icon: const Icon(Icons.check_box),
              cupertinoIcon: const Icon(CupertinoIcons.checkmark_square),
              label: context.t.tasks.overview,
              body: const OverviewTasks(),
            ),
            NavigationItem(
              key: const Key("today"),
              icon: const Icon(Icons.calendar_today),
              cupertinoIcon: const Icon(CupertinoIcons.calendar_today),
              label: context.t.tasks.today,
              color: getTheme(context).primary,
              body: FilteredTaskView(
                filter: (List<TaskEntity> tasks) {
                  final List<TaskItem> widgets = [];
                  for (final task in tasks) {
                    if (task.completed != true &&
                        task.endDate != null &&
                        task.endDate!.isToday()) {
                      widgets.add(TaskItem(task: task));
                    }
                  }
                  return widgets;
                },
              ),
            ),
            NavigationItem(
              key: const Key("tags"),
              icon: const Icon(Icons.tag),
              cupertinoIcon: const Icon(CupertinoIcons.tag),
              label: context.t.tasks.tags,
              color: getTheme(context).secondary,
              body: const TagsView(),
            ),
            NavigationItem(
              key: const Key("folders"),
              icon: const Icon(Icons.folder),
              cupertinoIcon: const Icon(CupertinoIcons.folder),
              label: context.t.tasks.folders.title,
              separatorBefore: true,
              color: getTheme(context).tertiary,
              body: const FoldersView(),
            ),
            NavigationItem(
              key: const Key("all_tasks"),
              separatorBefore: true,
              icon: const Icon(Icons.list),
              cupertinoIcon:
                  const Icon(CupertinoIcons.square_stack_3d_down_right),
              label: context.t.tasks.all_tasks,
              body: FilteredTaskView(
                filter: (tasks) {
                  return tasks
                      .where((task) => task.completed != true)
                      .map((task) => TaskItem(task: task))
                      .toList();
                },
              ),
            ),
            NavigationItem(
              key: const Key("completed_tasks"),
              icon: const Icon(Icons.check_circle),
              cupertinoIcon: const Icon(CupertinoIcons.checkmark_circle),
              label: context.t.tasks.completed_tasks,
              body: FilteredTaskView(
                filter: (tasks) {
                  return tasks
                      .where((task) => task.completed == true)
                      .map((task) => TaskItem(task: task))
                      .toList();
                },
              ),
            ),
          ],
        ),
        NavigationSection(
          key: const Key("calendar"),
          items: [
            NavigationItem(
              key: const Key("three_days"),
              icon: const Icon(Icons.calendar_today),
              cupertinoIcon: const Icon(CupertinoIcons.calendar_badge_plus),
              label: context.t.calendar.threeDays,
              body: Calendar(
                key: UniqueKey(),
                view: CalendarView.week,
                numberOfDays: 3,
              ),
            ),
            NavigationItem(
              key: const Key("month"),
              icon: const Icon(Icons.calendar_month),
              cupertinoIcon: const Icon(CupertinoIcons.calendar),
              label: context.t.calendar.month,
              body: Calendar(
                key: UniqueKey(),
                view: CalendarView.month,
              ),
            ),
            NavigationItem(
              key: const Key("day"),
              icon: const Icon(Icons.calendar_today),
              cupertinoIcon: const Icon(CupertinoIcons.calendar_today),
              label: context.t.calendar.day,
              body: Calendar(
                key: UniqueKey(),
                view: CalendarView.day,
              ),
            ),
          ],
        ),
        const NavigationSection(
          key: Key("add_task"),
          items: [],
        ),
        const NavigationSection(
          key: Key("habits"),
          items: [],
        ),
        const NavigationSection(
          key: Key("more"),
          items: [],
        ),
        const NavigationSection(
          key: Key("eisenhower"),
          items: [],
        ),
      ];

  // list of fixed items, limited to 5 on mobile
  // on mobile: the rest is added as a grid on the more apps page (last item to the right)
  // on desktop: the more apps page is moved at the end of the menu
  List<NavigationItem> primaryMenuItems(BuildContext context) => [
        NavigationItem(
          key: const Key("tasks"),
          icon: const Icon(
            LineAwesome.home_solid,
            size: 25,
          ),
          cupertinoIcon: const Icon(
            CupertinoIcons.checkmark_square,
            size: 25,
          ),
          label: context.t.tasks.title,
          body: const OverviewTasks(),
          mainSecondaryKey: "overview",
          appBar: AppBar(
            key: const Key("tasks"),
            backgroundColor: getTheme(context).surface,
            title: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
                    var selectedSecondarySection =
                        secondaryMenuSections(context)
                            .where((element) =>
                                (element.key as ValueKey).value ==
                                appState.primaryMenuSelectedKey)
                            .firstOrNull;
                    var selectedSecondaryItem = selectedSecondarySection?.items
                        .where((element) =>
                            (element.key as ValueKey).value ==
                            appState.secondaryMenuSelectedKey)
                        .firstOrNull;
                    return Text(
                      selectedSecondaryItem?.label ?? "",
                      style: getTextTheme(context).headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    );
                  })
                ],
              ),
            ),
            actions: [
              BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                if (authState is LoggedIn && !isDesktop(context)) {
                  return Padding(
                    padding: EdgeInsets.only(right: $constants.insets.sm),
                    child: const AccountAvatarWithSyncStatus(),
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
        NavigationItem(
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
          body: const Calendar(
            view: CalendarView.month,
          ),
          mainSecondaryKey: "month",
          appBar: AppBar(
              key: const Key("calendar"),
              backgroundColor: getTheme(context).surface,
              surfaceTintColor: getTheme(context).surface,
              title: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.t.calendar.title,
                      style: getTextTheme(context).headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      if (isDesktop(context)) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SizedBox(
                              width: getSize(context).width * 0.5,
                              height: getSize(context).height * 0.5,
                              child: const CalendarSettings(),
                            ),
                          ),
                        );
                      } else {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => const CalendarSettings());
                      }
                    },
                    child: const Icon(CupertinoIcons.settings)),
                SizedBox(
                  width: $constants.insets.sm,
                ),
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  if (authState is LoggedIn && !isDesktop(context)) {
                    return Padding(
                      padding: EdgeInsets.only(right: $constants.insets.sm),
                      child: const AccountAvatarWithSyncStatus(),
                    );
                  }
                  return Container();
                })
              ]),
        ),
        NavigationItem(
          key: const Key("add_task"),
          icon: Icon(
            LineAwesome.plus_solid,
            color: getTheme(context).tertiary,
          ),
          cupertinoIcon: Icon(
            CupertinoIcons.plus_circle_fill,
            color: getTheme(context).secondary,
          ),
          label: context.t.actions.add,
          onTap: (index) {
            if (isDesktop(context)) {
              showDialog(
                  context: context,
                  builder: (context) => const Dialog(child: AddTaskModal()));
            } else {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const AddTaskModal());
            }
          },
        ),
        NavigationItem(
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
          body: const Habits(),
          appBar: AppBar(
              key: const Key("habits"),
              backgroundColor: getTheme(context).surface,
              title: Center(
                child: Text(
                  context.t.habits.title,
                  style: getTextTheme(context).headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(CupertinoIcons.add),
                  onPressed: () {
                    var modal = const AddHabitModal();
                    if (isDesktop(context)) {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: getTheme(context).surface,
                          child: modal,
                        ),
                      );
                    } else {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => modal);
                    }
                  },
                ),
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  if (authState is LoggedIn && !isDesktop(context)) {
                    return Padding(
                      padding: EdgeInsets.only(right: $constants.insets.sm),
                      child: const AccountAvatarWithSyncStatus(),
                    );
                  }
                  return Container();
                })
              ]),
        ),
        NavigationItem(
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
          body: const MoreApps(),
          appBar: AppBar(
              key: const Key("more"),
              backgroundColor: getTheme(context).surface,
              title: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.t.more.title,
                      style: getTextTheme(context).headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              actions: [
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  if (authState is LoggedIn && !isDesktop(context)) {
                    return Padding(
                      padding: EdgeInsets.only(right: $constants.insets.sm),
                      child: const AccountAvatarWithSyncStatus(),
                    );
                  }
                  return Container();
                })
              ]),
        ),
        NavigationItem(
          key: const Key("eisenhower"),
          icon: const Icon(
            CupertinoIcons.grid,
            size: 25,
          ),
          cupertinoIcon: const Icon(
            CupertinoIcons.grid,
            size: 25,
          ),
          label: context.t.eisenhower.small_title,
          body: const EisenhowerMatrix(),
          appBar: AppBar(
            key: const Key("eisenhower"),
            backgroundColor: getTheme(context).surface,
            title: Text(
              context.t.eisenhower.title,
              style: getTextTheme(context).headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ];
}
