import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignFolder extends StatelessWidget {
  final TaskEntity task;
  final Function(Folder?) onFolderSelected;
  const AssignFolder(
      {super.key, required this.task, required this.onFolderSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FolderBloc, FolderState>(
      builder: (context, folderState) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
            vertical: $constants.insets.sm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.tasks.folders.select_a_folder,
                style: getTextTheme(context).headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              ...?folderState.folders?.map((folder) {
                return GestureDetector(
                  onTap: () {
                    if (folder.id == task.folderId) {
                      onFolderSelected(null);
                    } else {
                      onFolderSelected(folder);
                    }
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.md,
                      vertical: $constants.insets.xxs,
                    ),
                    decoration: BoxDecoration(
                      color: folder.color != null
                          ? hexToColor(folder.color!).withValues(alpha: 0.2)
                          : getTheme(context).primary,
                      borderRadius: BorderRadius.circular($constants.insets.xs),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (folder.emoji != null) ...[
                          Text(
                            folder.emoji!,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            width: $constants.insets.sm,
                          ),
                        ],
                        Text(
                          folder.name,
                          style: getTextTheme(context).bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const Spacer(),
                        if (folder.id == task.folderId) ...[
                          Icon(
                            Icons.check,
                            color: getTheme(context).primary,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
