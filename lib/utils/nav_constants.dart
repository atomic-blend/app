import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/app/ab_header.dart';
import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/blocs/time_entries/time_entry.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tasks/add_task_modal.dart';
import 'package:app/pages/timer/task_timer.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:app/services/sync.service.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

final $navConstants = NavigationConstants();

@immutable
class NavigationConstants {
  // list of fixed items, limited to 5 on mobile
  // on mobile: the rest is added as a grid on the more apps page (last item to the right)
  // on desktop: the more apps page is moved at the end of the menu
  List<NavigationItem> primaryMenuItems(BuildContext context) => [
        NavigationItem(
          key: const Key("tasks"),
          icon: LineAwesome.home_solid,
          cupertinoIcon: CupertinoIcons.checkmark_square,
          label: context.t.tasks.title,
          action: NavigationAction(
            icon: LineAwesome.plus_solid,
            label: "Add Task",
            onTap: () {
              if (isDesktop(context)) {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(child: AddTaskModal()));
              } else {
                showModalBottomSheet(
                    context: context, builder: (context) => AddTaskModal());
              }
            },
          ),
          subItems: [
            NavigationItem(
              key: const Key("overview"),
              icon: Icons.check_box,
              cupertinoIcon: CupertinoIcons.checkmark_square,
              label: context.t.tasks.overview,
              location: "/task/overview",
              header: _buildHeader(context, context.t.tasks.overview),
            ),
            NavigationItem(
              key: const Key("inbox"),
              icon: Icons.inbox,
              cupertinoIcon: CupertinoIcons.tray_arrow_down,
              color: Colors.cyan.darken(12),
              label: context.t.tasks.inbox,
              location: "/task/inbox",
              header: _buildHeader(context, context.t.tasks.inbox),
            ),
            NavigationItem(
              key: const Key("today"),
              icon: Icons.calendar_today,
              cupertinoIcon: CupertinoIcons.calendar_today,
              label: context.t.tasks.today,
              color: getTheme(context).primary,
              location: "/task/today",
              header: _buildHeader(context, context.t.tasks.today),
            ),
            NavigationItem(
              key: const Key("all_tasks"),
              icon: Icons.list,
              cupertinoIcon: CupertinoIcons.square_stack_3d_down_right,
              label: context.t.tasks.all_tasks,
              location: "/task/all-tasks",
              header: _buildHeader(context, context.t.tasks.all_tasks),
            ),
            NavigationItem(
              key: const Key("completed_tasks"),
              icon: Icons.check_circle,
              cupertinoIcon: CupertinoIcons.checkmark_circle,
              label: context.t.tasks.completed_tasks,
              location: "/task/completed",
              header: _buildHeader(context, context.t.tasks.completed_tasks),
            ),
            NavigationItem(
              key: const Key("tags"),
              icon: Icons.tag,
              cupertinoIcon: CupertinoIcons.tag,
              label: context.t.tasks.tags,
              color: getTheme(context).secondary,
              location: "/tags",
              header: _buildHeader(context, context.t.tasks.tags),
            ),
            NavigationItem(
              key: const Key("folders"),
              icon: Icons.folder,
              cupertinoIcon: CupertinoIcons.folder,
              label: context.t.tasks.folders.title,
              color: getTheme(context).tertiary,
              location: "/folders",
              header: _buildHeader(context, context.t.tasks.folders.title),
            ),
          ],
        ),
        NavigationItem(
          key: const Key("calendar"),
          icon: LineAwesome.calendar,
          cupertinoIcon: CupertinoIcons.calendar,
          label: context.t.calendar.title,
          action: NavigationAction(
            icon: LineAwesome.plus_solid,
            label: "Add Task",
            onTap: () {
              if (isDesktop(context)) {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(child: AddTaskModal()));
              } else {
                showModalBottomSheet(
                    context: context, builder: (context) => AddTaskModal());
              }
            },
          ),
          subItems: [
            if (isDesktop(context))
              NavigationItem(
                key: const Key("week"),
                icon: Icons.calendar_view_week,
                cupertinoIcon: CupertinoIcons.calendar,
                label: context.t.calendar.week,
                location: "/calendar/week",
                header: _buildHeader(context, context.t.calendar.week),
              ),
            NavigationItem(
              key: const Key("schedule"),
              icon: Icons.schedule,
              cupertinoIcon: CupertinoIcons.clock,
              label: context.t.calendar.schedule,
              location: "/calendar/schedule",
              header: _buildHeader(context, context.t.calendar.schedule),
            ),
            NavigationItem(
              key: const Key("three_days"),
              icon: Icons.calendar_today,
              cupertinoIcon: CupertinoIcons.calendar_badge_plus,
              label: context.t.calendar.threeDays,
              location: "/calendar/three-days",
              header: _buildHeader(context, context.t.calendar.threeDays),
            ),
            NavigationItem(
              key: const Key("month"),
              icon: Icons.calendar_month,
              cupertinoIcon: CupertinoIcons.calendar,
              label: context.t.calendar.month,
              location: "/calendar/month",
              header: _buildHeader(context, context.t.calendar.month),
            ),
            NavigationItem(
              key: const Key("day"),
              icon: Icons.calendar_today,
              cupertinoIcon: CupertinoIcons.calendar_today,
              label: context.t.calendar.day,
              location: "/calendar/day",
              header: _buildHeader(context, context.t.calendar.day),
            ),
          ],
        ),
        NavigationItem(
          key: const Key("habits"),
          icon: LineAwesome.bolt_solid,
          cupertinoIcon: CupertinoIcons.bolt_fill,
          label: context.t.habits.title,
          location: "/habits",
          header: _buildHeader(context, context.t.habits.title),
        ),
        NavigationItem(
          key: const Key("search"),
          icon: Icons.search,
          cupertinoIcon: CupertinoIcons.search,
          label: context.t.search.title,
          location: "/search",
          header: _buildHeader(context, context.t.search.title),
        ),
        NavigationItem(
          key: const Key("eisenhower"),
          icon: CupertinoIcons.square_grid_2x2,
          cupertinoIcon: CupertinoIcons.square_grid_2x2,
          label: context.t.eisenhower.small_title,
          location: "/task/eisenhower",
          header: _buildHeader(context, context.t.eisenhower.small_title),
        ),
        NavigationItem(
          key: const Key("timer"),
          icon: CupertinoIcons.stopwatch,
          cupertinoIcon: CupertinoIcons.stopwatch,
          label: context.t.timer.title,
          onTap: () {
            if (isDesktop(context)) {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SizedBox(
                    width: getSize(context).width * 0.7,
                    height: getSize(context).height * 0.75,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular($constants.corners.lg),
                        child: const TaskTimer()),
                  ),
                ),
              );
            } else {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SizedBox(
                  height: getSize(context).height * 0.8,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular($constants.corners.lg),
                        topRight: Radius.circular($constants.corners.lg),
                      ),
                      child: const TaskTimer()),
                ),
              );
            }
          },
          header: _buildHeader(context, context.t.timer.title),
        ),
        NavigationItem(
          key: const Key("account"),
          icon: LineAwesome.cog_solid,
          cupertinoIcon: CupertinoIcons.settings,
          label: "Account & Settings",
          location: "/account",
          subItems: const [],
          header: _buildHeader(context, "Account & Settings"),
        ),
      ];
}

Widget _buildHeader(BuildContext context, String title) {
  return BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
    return BlocBuilder<FolderBloc, FolderState>(
        builder: (context, folderState) {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return BlocBuilder<TasksBloc, TasksState>(
            builder: (context, tasksState) {
              return BlocBuilder<HabitBloc, HabitState>(
                builder: (context, habitState) {
                  return BlocBuilder<TimeEntryBloc, TimeEntryState>(
                      builder: (context, timeEntryState) {
                    return ABHeader(
                      title: title,
                      syncedElements: SyncService.getSyncedElements(
                        tasksState: tasksState,
                        folderState: folderState,
                        tagState: tagState,
                        habitState: habitState,
                        timeEntryState: timeEntryState,
                        authState: authState,
                      ),
                      isSyncing: SyncService.isSyncing(
                        tasksState: tasksState,
                        folderState: folderState,
                        tagState: tagState,
                        habitState: habitState,
                        authState: authState,
                        timeEntryState: timeEntryState,
                      ),
                    );
                  });
                },
              );
            },
          );
        },
      );
    });
  });
}
