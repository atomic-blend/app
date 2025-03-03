import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class SyncStatusButton extends StatelessWidget {
  const SyncStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      return GestureDetector(
        onTap: () {
          SyncService.sync(context);
        },
        child: SizedBox(
          width: 25,
          child: Stack(
            children: [
              const Icon(LineAwesome.cloud_solid),
              Positioned(
                bottom: _isLoading(taskState: taskState) ? 0 : 3,
                right: _isLoading(taskState: taskState) ? 0 : 2,
                child: !_isLoading(taskState: taskState)
                    ? Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      )
                    : Container(
                        width: 14,
                        height: 14,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: getTheme(context).surfaceContainer,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const CircularProgressIndicator(
                          color: Colors.blueAccent,
                          strokeWidth: 3,
                        ),
                      ),
              )
            ],
          ),
        ),
      );
    });
  }

  _isLoading({required TasksState taskState}) {
    return taskState is TaskAddLoading ||
            taskState is TaskEditLoading ||
            taskState is TaskDeleteLoading ||
            taskState is TasksLoading
        ? true
        : false;
  }
}
