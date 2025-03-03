import 'package:app/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

extension DateTimeExtension on DateTime {
  String formatDueDate(BuildContext context) {
    if (isToday()) {
      return context.t.tasks.due_dates.today;
    } else if (isTomorrow()) {
      return context.t.tasks.due_dates.tomorrow;
    } else {
      return Jiffy.parseFromDateTime(this).yMMMMd;
    }
  }

  bool isToday() {
    final today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }
}
