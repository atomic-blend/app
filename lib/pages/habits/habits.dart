import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/components/modals/delete_confirm_modal.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/entities/habit/habit_entry/habit_entry.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/habits/add_or_edit_habit_modal.dart';
import 'package:app/pages/habits/habit_heatmap.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Habits extends StatefulWidget {
  const Habits({super.key});

  @override
  State<Habits> createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {
  int? mode = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      child: ElevatedContainer(
        child:
            BlocBuilder<HabitBloc, HabitState>(builder: (context, habitState) {
          if (habitState.habits == null || habitState.habits!.isEmpty) {
            return RefreshIndicator(
              onRefresh: () {
                SyncService.sync(context);
                return Future.delayed(const Duration(seconds: 1));
              },
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Center(
                    child: Transform.scale(
                      scale: 1.3,
                      child: Lottie.asset(
                        'assets/animations/getting-started.json',
                        width: isDesktop(context)
                            ? getSize(context).width * 0.2
                            : getSize(context).width * 0.7,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      context.t.habits.no_habits,
                      style: getTextTheme(context).headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Center(child: Text(context.t.habits.get_started_now))
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () {
              SyncService.sync(context);
              return Future.delayed(const Duration(seconds: 1));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.sm,
                  vertical: $constants.insets.xs),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: $constants.insets.xs,
                  ),
                  Center(
                    child: SizedBox(
                      height: 30,
                      width: double.infinity,
                      child: AnimatedToggleSwitch<int?>.rolling(
                        current: mode,
                        indicatorSize:
                            Size.fromWidth(getSize(context).width * 0.8 / 2),
                        values: const [0, 1],
                        iconBuilder: (value, foreground) {
                          return AutoSizeText(
                              maxLines: 1,
                              [context.t.habits.list, context.t.habits.overview]
                                  .elementAt(value!),
                              style:
                                  getTextTheme(context).bodyMedium!.copyWith());
                        },
                        styleBuilder: (value) {
                          return ToggleStyle(
                            borderColor: Colors.transparent,
                            indicatorColor: value == mode
                                ? getTheme(context).surfaceContainer
                                : getTheme(context).surface,
                            backgroundColor: getTheme(context).surface,
                          );
                        },
                        onChanged: (value) {
                          setState(() {
                            mode = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.xs,
                  ),
                  if (mode == 0)
                    SizedBox(
                      height: getSize(context).height * 0.75,
                      child: _listView(
                        context,
                        habitState.habits!,
                      ),
                    ),
                  if (mode == 1)
                    SizedBox(
                      height: getSize(context).height * 0.75,
                      child: _heatMapView(
                        context,
                        habitState.habits!,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  _listView(BuildContext context, List<Habit> habits) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        final habitProgress = _computeDailyProgress(habit);
        return Padding(
          padding: EdgeInsets.only(bottom: $constants.insets.xs),
          child: Slidable(
            key: ValueKey(habits[index].id),
            endActionPane: ActionPane(motion: const ScrollMotion(), children: [
              SizedBox(
                width: $constants.insets.xs,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var selector = ViewOrEditHabitModal(
                      habit: habits[index],
                      isEdit: true,
                    );
                    if (isDesktop(context)) {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(child: selector));
                    } else {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => selector);
                    }
                  },
                  child: Container(
                    height: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: $constants.insets.md),
                    decoration: BoxDecoration(
                      color: getTheme(context).surface,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    child: const Icon(
                      CupertinoIcons.pencil,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: $constants.insets.xs,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => DeleteConfirmModal(
                            title: context.t.habits.delete_habit.title,
                            description:
                                context.t.habits.delete_habit.description,
                            warning: context.t.habits.delete_habit.warning,
                            onDelete: () {
                              context.read<HabitBloc>().add(
                                    DeleteHabit(habits[index]),
                                  );
                            }));
                  },
                  child: Container(
                    height: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: $constants.insets.md),
                    decoration: BoxDecoration(
                      color: getTheme(context).error,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    child: const Icon(
                      CupertinoIcons.trash,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
            child: GestureDetector(
              onTap: () {
                var selector = ViewOrEditHabitModal(
                  habit: habits[index],
                  isEdit: false,
                );
                if (isDesktop(context)) {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(child: selector));
                } else {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => selector);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: getTheme(context).surface,
                  borderRadius: BorderRadius.circular($constants.corners.sm),
                ),
                padding: EdgeInsets.all($constants.insets.sm),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: getTheme(context).surface,
                        borderRadius:
                            BorderRadius.circular($constants.corners.full),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          habits[index].emoji != null &&
                                  habits[index].emoji != ""
                              ? habits[index].emoji!
                              : "📋",
                          maxLines: 1,
                          style: getTextTheme(context).headlineLarge!.copyWith(
                                color: getTheme(context).onPrimary,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: $constants.insets.sm,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          habits[index].name!,
                          style: getTextTheme(context).titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          habits[index].getHabitShortDescription(context),
                          style: getTextTheme(context).bodyMedium,
                        ),
                      ],
                    ),
                    const Spacer(),
                    if (habitProgress != null && habitProgress < 1)
                      GestureDetector(
                        onTap: () {
                          context.read<HabitBloc>().add(
                                AddHabitEntry(
                                  HabitEntry(
                                    entryDate: DateTime.now().toUtc(),
                                    habitId: habit.id!,
                                  ),
                                ),
                              );
                        },
                        child: CircularPercentIndicator(
                          progressColor: getTheme(context).primary,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "${(habitProgress * 100).toStringAsFixed(0)} %",
                            style: getTextTheme(context).bodySmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          radius: 23,
                          percent: habitProgress,
                        ),
                      ),
                    if (habitProgress != null && habitProgress == 1)
                      Padding(
                        padding: EdgeInsets.only(right: $constants.insets.xs),
                        child: Icon(
                          CupertinoIcons.check_mark_circled_solid,
                          color: getTheme(context).primary,
                          size: 30,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // compute the daily progress of the habit
  double? _computeDailyProgress(Habit habit) {
    final now = DateTime.now();
    switch (habit.frequency) {
      case "daily":
      case "weekly":
        if (habit.startDate == null) return null;
        if (habit.daysOfWeek?.contains(now.weekday - 1) == false) {
          return null;
        }
        final entriesToday = habit.entries
                ?.where((entry) =>
                    entry.entryDate.year == now.year &&
                    entry.entryDate.month == now.month &&
                    entry.entryDate.day == now.day)
                .toList() ??
            [];
        final total = habit.numberOfTimes!;
        if (kDebugMode) {
          print((entriesToday.length / total).toDouble());
        }
        return (entriesToday.length / total).toDouble();
      case "monthly":
        break;
      case "repeatition":
        break;
      default:
        if (kDebugMode) {
          print("Unknown frequency: ${habit.frequency}");
        }
        break;
    }
    return null;
  }

  _heatMapView(BuildContext context, List<Habit> habits) {
    return ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return HabitHeatmap(habit: habit);
        });
  }
}
