import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/responsive_stateless_widget.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/timer/timer_utils.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedTimer extends ResponsiveStatelessWidget {
  final TimerMode mode;
  final TaskEntity? task;
  const CompletedTimer({super.key, this.task, required this.mode});

  @override
  Widget buildMobile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getTheme(context).surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular($constants.corners.lg),
          topRight: Radius.circular($constants.corners.lg),
        ),
      ),
      padding: EdgeInsets.only(
        top: $constants.insets.xxs,
        left: $constants.insets.sm,
        right: $constants.insets.sm,
        bottom: $constants.insets.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: getTheme(context).onSurface.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular($constants.corners.xs),
            ),
          ),
          SizedBox(height: $constants.insets.lg),

          // Icon and title
          Container(
            padding: EdgeInsets.all($constants.insets.lg),
            decoration: BoxDecoration(
              color: getTheme(context).primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular($constants.corners.full),
            ),
            child: Icon(
              mode == TimerMode.pomodoro
                  ? CupertinoIcons.alarm_fill
                  : CupertinoIcons.stopwatch_fill,
              size: 48,
              color: getTheme(context).primary,
            ),
          ),

          SizedBox(height: $constants.insets.lg),

          Text(
            mode == TimerMode.pomodoro
                ? '${context.t.timer.modes['pomodoro']!} ${context.t.timer.completed}'
                : '${context.t.timer.modes['stopwatch']!} ${context.t.timer.completed}',
            style: getTextTheme(context).headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: $constants.insets.md),

          if (task != null) ...[
            ElevatedContainer(
              padding: EdgeInsets.all($constants.insets.md),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.checkmark_circle_fill,
                    color: getTheme(context).primary,
                    size: 20,
                  ),
                  SizedBox(width: $constants.insets.sm),
                  Expanded(
                    child: Text(
                      task!.title,
                      style: getTextTheme(context).bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: $constants.insets.md),
          ],

          Text(
            mode == TimerMode.pomodoro
                ? context.t.timer.pomodoro_completed_message
                : context.t.timer.stopwatch_completed_message,
            style: getTextTheme(context).bodyMedium,
            textAlign: TextAlign.center,
          ),

          if (mode == TimerMode.pomodoro) ...[
            SizedBox(height: $constants.insets.sm),
            Text(
              '${context.t.timer.duration}: ${context.t.times.minutes(n: TimerUtils.getPomodoroDuration(), nb: TimerUtils.getPomodoroDuration()).toLowerCase()}',
              style: getTextTheme(context).bodySmall?.copyWith(
                    color: getTheme(context).onSurface.withValues(alpha: 0.7),
                  ),
              textAlign: TextAlign.center,
            ),
          ],

          SizedBox(height: $constants.insets.xl),

          // Actions
          Row(
            children: [
              Expanded(
                  child: PrimaryButtonSquare(
                text: context.t.actions.close,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
            ],
          ),

          SizedBox(height: $constants.insets.md),
        ],
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            mode == TimerMode.pomodoro
                ? CupertinoIcons.alarm_fill
                : CupertinoIcons.stopwatch_fill,
            color: getTheme(context).primary,
          ),
          SizedBox(width: $constants.insets.xs),
          Text(
            mode == TimerMode.pomodoro
                ? '${context.t.timer.modes['pomodoro']!} ${context.t.timer.completed}'
                : '${context.t.timer.modes['stopwatch']!} ${context.t.timer.completed}',
            style: getTextTheme(context).headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (task != null) ...[
            Text(
              '${context.t.timer.task_label}: ${task!.title}',
              style: getTextTheme(context).bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: $constants.insets.sm),
          ],
          Text(
            mode == TimerMode.pomodoro
                ? context.t.timer.pomodoro_completed_message
                : context.t.timer.stopwatch_completed_message,
            style: getTextTheme(context).bodyMedium,
          ),
          SizedBox(height: $constants.insets.md),
          if (mode == TimerMode.pomodoro)
            Text(
              '${context.t.timer.duration}: ${context.t.times.minutes(n: TimerUtils.getPomodoroDuration(), nb: TimerUtils.getPomodoroDuration()).toLowerCase()}',
              style: getTextTheme(context).bodySmall?.copyWith(
                    color: getTheme(context).onSurface.withValues(alpha: 0.7),
                  ),
            ),
        ],
      ),
      actions: const [],
    );
  }
}
