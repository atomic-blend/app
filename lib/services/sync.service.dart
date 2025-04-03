import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/device_calendar/device_calendar.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncService {
  static Future<void> sync(BuildContext context) async {
    if (context.read<AuthBloc>().state is! LoggedIn) return;
    
    // Sync data
    context.read<TasksBloc>().add(const LoadTasks());
  }
}
