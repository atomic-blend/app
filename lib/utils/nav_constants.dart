import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tasks/add_task_modal.dart';
import 'package:app/pages/timer/task_timer.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            ),
            NavigationItem(
              key: const Key("inbox"),
              icon: Icons.inbox,
              cupertinoIcon: CupertinoIcons.tray_arrow_down,
              color: Colors.cyan.darken(12),
              label: context.t.tasks.inbox,
              location: "/task/inbox",
            ),
            NavigationItem(
              key: const Key("today"),
              icon: Icons.calendar_today,
              cupertinoIcon: CupertinoIcons.calendar_today,
              label: context.t.tasks.today,
              color: getTheme(context).primary,
              location: "/task/today",
            ),
            NavigationItem(
              key: const Key("all_tasks"),
              icon: Icons.list,
              cupertinoIcon: CupertinoIcons.square_stack_3d_down_right,
              label: context.t.tasks.all_tasks,
              location: "/task/all-tasks",
            ),
            NavigationItem(
              key: const Key("completed_tasks"),
              icon: Icons.check_circle,
              cupertinoIcon: CupertinoIcons.checkmark_circle,
              label: context.t.tasks.completed_tasks,
              location: "/task/completed",
            ),
            NavigationItem(
              key: const Key("tags"),
              icon: Icons.tag,
              cupertinoIcon: CupertinoIcons.tag,
              label: context.t.tasks.tags,
              color: getTheme(context).secondary,
              location: "/tags",
            ),
            NavigationItem(
              key: const Key("folders"),
              icon: Icons.folder,
              cupertinoIcon: CupertinoIcons.folder,
              label: context.t.tasks.folders.title,
              color: getTheme(context).tertiary,
              location: "/folders",
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
              ),
            NavigationItem(
              key: const Key("schedule"),
              icon: Icons.schedule,
              cupertinoIcon: CupertinoIcons.clock,
              label: context.t.calendar.schedule,
              location: "/calendar/schedule",
            ),
            NavigationItem(
              key: const Key("three_days"),
              icon: Icons.calendar_today,
              cupertinoIcon: CupertinoIcons.calendar_badge_plus,
              label: context.t.calendar.threeDays,
              location: "/calendar/three-days",
            ),
            NavigationItem(
              key: const Key("month"),
              icon: Icons.calendar_month,
              cupertinoIcon: CupertinoIcons.calendar,
              label: context.t.calendar.month,
              location: "/calendar/month",
            ),
            NavigationItem(
              key: const Key("day"),
              icon: Icons.calendar_today,
              cupertinoIcon: CupertinoIcons.calendar_today,
              label: context.t.calendar.day,
              location: "/calendar/day",
            ),
          ],
        ),
        NavigationItem(
          key: const Key("habits"),
          icon: LineAwesome.bolt_solid,
          cupertinoIcon: CupertinoIcons.bolt_fill,
          label: context.t.habits.title,
        ),
        NavigationItem(
          key: const Key("eisenhower"),
          icon: CupertinoIcons.square_grid_2x2,
          cupertinoIcon: CupertinoIcons.square_grid_2x2,
          label: context.t.eisenhower.small_title,
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
        ),
        NavigationItem(
          key: const Key("account"),
          icon: LineAwesome.user_solid,
          cupertinoIcon: CupertinoIcons.person,
          label: "Account",
          subItems: [],
        ),
        NavigationItem(
          key: const Key("settings"),
          icon: LineAwesome.cog_solid,
          cupertinoIcon: CupertinoIcons.gear,
          label: "Settings",
          subItems: [],
        ),
      ];
}
