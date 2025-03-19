import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountAvatarWithSyncStatus extends StatelessWidget {
  const AccountAvatarWithSyncStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        return GestureDetector(
          onDoubleTap: () {
            SyncService.sync(context);
          },
          child: SizedBox(
            child: Stack(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: getTheme(context).primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    "${authState.user?.firstname?[0] ?? "A"}${authState.user?.lastname?[0] ?? "B"}",
                    style: getTextTheme(context).labelSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  )),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
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
