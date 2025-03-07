import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncService {
  static Future<void> sync(BuildContext context) async {
    // Sync data
    // context.read<AuthBloc>().add(const RefreshUser());
    context.read<TasksBloc>().add(const LoadTasks());
  }
}
