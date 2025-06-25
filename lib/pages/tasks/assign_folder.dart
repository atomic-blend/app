import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.t.tasks.folders.select_a_folder,
                    style: getTextTheme(context).headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      onFolderSelected(null);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      context.t.actions.clear,
                      style: getTextTheme(context).bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: getTheme(context).primary,
                          ),
                    ),
                  ),
                ],
              ),
              if (folderState.folders == null || folderState.folders!.isEmpty)
                Text(
                  context.t.tasks.folders.no_folders,
                  style: getTextTheme(context).bodyLarge,
                )
              else
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
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: $constants.insets.sm,
                                ),
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
                                      ? hexToColor(folder.color!).lighten(35)
                                      : Colors.grey,
                                ),
                                child: Column(
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
                                      style: getTextTheme(context)
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
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
