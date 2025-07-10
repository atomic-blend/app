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
      return Jiffy.parseFromDateTime(this).toLocal().yMMMMd;
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

  String diffString(AppLocale locale, DateTime other) {
    final diff = difference(other).abs();

    final days = diff.inDays;
    final hours = diff.inHours % 24;
    final minutes = diff.inMinutes % 60;

    final parts = <String>[];
    if (days > 0) parts.add('$days${locale.translations.time_units.short.day}');
    if (hours > 0 || days > 0) {
      parts.add('$hours${locale.translations.time_units.short.hour}');
    }
    parts.add('$minutes${locale.translations.time_units.short.minute}');

    return parts.join(' ');
  }

  bool isDayDate() {
    // check if a date is at midnight
    return hour == 0 && minute == 0 && second == 0;
  }

  DateTime midnight() {
    // return date at midnight
    return DateTime.utc(year, month, day);
  }

  bool isThisWeek({bool includeToday = true, includeTomorrow = true}) {
    if (!includeToday && isToday()) {
      return false;
    }

    if (!includeTomorrow && isTomorrow()) {
      return false;
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Calculate days until the end of week (Sunday)
    final daysUntilEndOfWeek = (7 - now.weekday) % 7;

    // If today is Sunday, we need to add 7 to get next Sunday
    final daysToAdd = daysUntilEndOfWeek == 0 ? 7 : daysUntilEndOfWeek;

    final endOfWeek = today.add(Duration(days: daysToAdd));

    return isAfter(today) && isBefore(endOfWeek.add(const Duration(days: 1)));
  }
}
