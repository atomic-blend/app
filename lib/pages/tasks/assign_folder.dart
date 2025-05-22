import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignFolder extends StatelessWidget {
  final String? folderId;
  final Function(Folder?) onFolderSelected;
  const AssignFolder(
      {super.key, this.folderId, required this.onFolderSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FolderBloc, FolderState>(
      builder: (context, folderState) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.xs,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              SingleChildScrollView(
                child: Row(
                  children: [
                    ...?folderState.folders?.map((folder) {
                      return GestureDetector(
                        onTap: () {
                          if (folder.id == folderId) {
                            onFolderSelected(null);
                          } else {
                            onFolderSelected(folder);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Column(
                          children: [
                            if (folder.emoji != null) ...[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: folder.id != folderId
                                      ? null
                                      : Border.all(
                                          color: getTheme(context)
                                              .primary
                                              .withValues(alpha: 0.75),
                                          width: 1,
                                        ),
                                  borderRadius: BorderRadius.circular(
                                      $constants.corners.full),
                                  color: folder.color != null
                                      ? hexToColor(folder.color!)
                                          .withValues(alpha: 0.2)
                                      : Colors.grey,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      folder.emoji!,
                                      style: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
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
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
