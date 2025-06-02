import 'dart:async';

import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/timer/task_timer.dart';
import 'package:app/pages/timer/timer_utils.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OverviewTasks extends StatefulWidget {
  const OverviewTasks({super.key});

  @override
  State<OverviewTasks> createState() => _OverviewTasksState();
}

class _OverviewTasksState extends State<OverviewTasks> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _uiTimer;
  double _progress = 0.0;
  Duration? _pomodoroDuration;
  TimerMode? _currentTimerMode;

  @override
  void initState() {
    SyncService.sync(context);
    _initializeTimerState();
    _startUITimer();
    super.initState();
  }

  @override
  void dispose() {
    _uiTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeTimerState() async {
    if (TimerUtils.isPomodoroRunning()) {
      _currentTimerMode = TimerMode.pomodoro;
      _pomodoroDuration = Duration(minutes: TimerUtils.getPomodoroDuration());
    } else if (TimerUtils.isStopwatchRunning()) {
      _currentTimerMode = TimerMode.stopwatch;
      _pomodoroDuration = Duration(minutes: TimerUtils.getPomodoroDuration());
    }
  }

  void _startUITimer() {
    _uiTimer?.cancel();
    _uiTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      await _updateTimerDisplay();
    });
  }

  void _stopUITimer() {
    _uiTimer?.cancel();
    _uiTimer = null;
  }

  Future<void> _updateTimerDisplay() async {
    if (!mounted) return;

    // Check if any timer is still running
    final isPomodoroRunning = TimerUtils.isPomodoroRunning();
    final isStopwatchRunning = TimerUtils.isStopwatchRunning();

    if (!isPomodoroRunning && !isStopwatchRunning) {
      _stopUITimer();
      setState(() {
        _progress = 0.0;
        _currentTimerMode = null;
      });
      return;
    }

    // Determine current timer mode
    if (isPomodoroRunning) {
      _currentTimerMode = TimerMode.pomodoro;
    } else if (isStopwatchRunning) {
      _currentTimerMode = TimerMode.stopwatch;
    }

    if (_currentTimerMode != null) {
      final duration = await TimerUtils.getTimerDuration(_currentTimerMode!);
      final isRunning = TimerUtils.isTimerRunning(_currentTimerMode!);

      setState(() {
        if (_currentTimerMode == TimerMode.pomodoro) {
          // Pomodoro: countdown from 1.0 to 0.0
          if (!isRunning) {
            _progress = 1.0;
          } else {
            _progress = _pomodoroDuration != null
                ? (duration.inSeconds / _pomodoroDuration!.inSeconds)
                    .clamp(0.0, 1.0)
                : 1.0;
          }
        } else {
          // Stopwatch: count up from 0.0 to 1.0
          if (!isRunning) {
            _progress = 0.0;
          } else {
            _progress = _pomodoroDuration != null
                ? (duration.inSeconds / _pomodoroDuration!.inSeconds)
                    .clamp(0.0, 1.0)
                : 0.0;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        final todayTasks = _todayTasks(taskState.tasks ?? []);
        final tomorrowTasks = _tomorrowTasks(taskState.tasks ?? []);
        final thisWeekTasks = _thisWeekTasks(taskState.tasks ?? []);
        return Padding(
          padding: isDesktop(context)
              ? EdgeInsets.only(
                  right: $constants.insets.sm,
                  left: $constants.insets.xs,
                  bottom: $constants.insets.sm,
                )
              : EdgeInsets.only(
                  right: $constants.insets.sm,
                  left: $constants.insets.sm,
                  bottom: $constants.insets.sm,
                ),
          child: RefreshIndicator(
            onRefresh: () {
              SyncService.sync(context);
              return Future.delayed(const Duration(seconds: 1));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (TimerUtils.isPomodoroRunning() ||
                    TimerUtils.isStopwatchRunning())
                  GestureDetector(
                    onTap: () {
                      if (isDesktop(context)) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SizedBox(
                              width: getSize(context).width * 0.5,
                              height: getSize(context).height * 0.5,
                              child: const TaskTimer(),
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
                                  topLeft:
                                      Radius.circular($constants.corners.lg),
                                  topRight:
                                      Radius.circular($constants.corners.lg),
                                ),
                                child: const TaskTimer()),
                          ),
                        );
                      }
                    },
                    child: ElevatedContainer(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                        vertical: $constants.insets.xs,
                      ),
                      child: Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 30.0,
                            lineWidth: 6.0,
                            animation: true,
                            animateFromLastPercent: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor:
                                getTheme(context).surfaceContainer.darken(10),
                            percent: _progress,
                            center: Icon(
                              _currentTimerMode == TimerMode.pomodoro
                                  ? CupertinoIcons.timer
                                  : CupertinoIcons.stopwatch,
                              color: getTheme(context).primary,
                              size: 20,
                            ),
                            progressColor: getTheme(context).primary,
                          ),
                          SizedBox(width: $constants.insets.sm),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _currentTimerMode == TimerMode.pomodoro
                                      ? context.t.timer.pomo_running
                                      : context.t.timer.timer_running,
                                  style: getTextTheme(context)
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                if (_currentTimerMode != null)
                                  Builder(
                                    builder: (context) {
                                      final duration =
                                          TimerUtils.getTimerDuration(
                                              _currentTimerMode!);
                                      final minutes = duration.inMinutes;
                                      final seconds = duration.inSeconds % 60;
                                      return Text(
                                        context.t.timer.time_left(timeLeft: "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}"),
                                        style: getTextTheme(context)
                                            .bodySmall!
                                            .copyWith(
                                              color: getTheme(context)
                                                  .onSurface
                                                  .withValues(alpha: 0.7),
                                            ),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                          Icon(
                            CupertinoIcons.chevron_right,
                            color: getTheme(context).onSurface.withOpacity(0.5),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: $constants.insets.xs),
                ElevatedContainer(
                  child: ABSearchBar(
                      controller: _searchController, onSubmitted: (value) {}),
                ),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.xs,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.t.times.today,
                            style: getTextTheme(context).titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          if (todayTasks.isEmpty)
                            Text(
                              context.t.tasks.nothing_to_do,
                              style: getTextTheme(context).labelSmall!,
                            ),
                          if (todayTasks.isNotEmpty) ...todayTasks,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.xs,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.t.times.tomorrow,
                            style: getTextTheme(context).titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          if (tomorrowTasks.isEmpty)
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: $constants.insets.xxs),
                              child: Text(
                                context.t.tasks.day_off,
                                style: getTextTheme(context).labelSmall!,
                              ),
                            ),
                          if (tomorrowTasks.isNotEmpty) ...tomorrowTasks,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.xs,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.t.times.this_week,
                            style: getTextTheme(context).titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          if (thisWeekTasks.isEmpty)
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: $constants.insets.xxs),
                              child: Text(
                                context.t.tasks.nothing_to_do,
                                style: getTextTheme(context).labelSmall!,
                              ),
                            ),
                          if (thisWeekTasks.isNotEmpty) ...thisWeekTasks,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  List<TaskItem> _todayTasks(List<TaskEntity> tasks) {
    final List<TaskItem> widgets = [];
    for (final task in tasks) {
      if (task.completed != true &&
          task.endDate != null &&
          (task.endDate!.isToday() || task.endDate!.isBefore(DateTime.now()))) {
        widgets.add(TaskItem(task: task));
      }
    }
    return widgets;
  }

  List<TaskItem> _tomorrowTasks(List<TaskEntity> tasks) {
    final List<TaskItem> widgets = [];
    for (final task in tasks) {
      if (task.completed != true &&
          task.endDate != null &&
          task.endDate!.isTomorrow()) {
        widgets.add(TaskItem(task: task));
      }
    }
    return widgets;
  }

  List<TaskItem> _thisWeekTasks(List<TaskEntity> tasks) {
    final List<TaskItem> widgets = [];
    for (final task in tasks) {
      if (task.completed != true &&
          task.endDate != null &&
          task.endDate!.isThisWeek(
            includeToday: false,
            includeTomorrow: false,
          )) {
        widgets.add(TaskItem(task: task));
      }
    }
    return widgets;
  }
}
