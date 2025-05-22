import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/components/buttons/icon_text_card.dart';
import 'package:app/components/modals/delete_confirm_modal.dart';
import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/folder/add_folder_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyFolders extends StatefulWidget {
  const MyFolders({super.key});

  @override
  State<MyFolders> createState() => _MyFoldersState();
}

class _MyFoldersState extends State<MyFolders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context).surface,
      appBar: AppBar(
        backgroundColor: getTheme(context).surface,
        title: Text(
          context.t.tasks.folders.title,
          style: getTextTheme(context).titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showAddFolderModal(context);
              },
              icon: const Icon(CupertinoIcons.add)),
        ],
      ),
      body:
          BlocBuilder<FolderBloc, FolderState>(builder: (context, folderState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm, vertical: $constants.insets.xs),
          child: Column(
            children: [
              if (folderState.folders?.isEmpty == true)
                Text(
                  context.t.tasks.folders.no_folders,
                  style: getTextTheme(context).bodyMedium,
                )
              else if (folderState.folders?.isNotEmpty == true)
                ...(folderState.folders ?? []).map(
                  (folder) => Padding(
                    padding: EdgeInsets.only(
                      bottom: $constants.insets.xs,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // optional: folder tap action
                      },
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SizedBox(
                            width: $constants.insets.xs,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                                outlinedButtonTheme:
                                    const OutlinedButtonThemeData(
                              style: ButtonStyle(
                                  iconColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  iconSize: WidgetStatePropertyAll(25)),
                            )),
                            child: SlidableAction(
                              onPressed: (context) {
                                showDialog(
                                    context: context,
                                    builder: (context) => DeleteConfirmModal(
                                          title: context.t.tags.delete.title,
                                          description:
                                              context.t.tags.delete.description,
                                          warning:
                                              context.t.tags.delete.warning,
                                          onDelete: () {
                                            context.read<FolderBloc>().add(
                                                  DeleteFolder(
                                                    folder,
                                                  ),
                                                );
                                          },
                                        ));
                              },
                              backgroundColor: getTheme(context).error,
                              foregroundColor: Colors.white,
                              icon: CupertinoIcons.delete,
                              borderRadius: BorderRadius.circular(
                                $constants.corners.sm,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: $constants.insets.xs,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                                outlinedButtonTheme:
                                    const OutlinedButtonThemeData(
                              style: ButtonStyle(
                                  iconColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  iconSize: WidgetStatePropertyAll(30)),
                            )),
                            child: SlidableAction(
                              onPressed: (context) {
                                _showAddFolderModal(context, folder: folder);
                              },
                              backgroundColor:
                                  getTheme(context).surfaceContainer,
                              foregroundColor: getTheme(context).onSurface,
                              icon: CupertinoIcons.pencil,
                              borderRadius: BorderRadius.circular(
                                $constants.corners.sm,
                              ),
                            ),
                          ),
                        ]),
                        child: IconTextCard(
                          width: double.infinity,
                          title: folder.name,
                          icon: CupertinoIcons.folder,
                          color: folder.color != null
                              ? hexToColor(folder.color!).withValues(alpha: 0.2)
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  _showAddFolderModal(BuildContext context, {Folder? folder}) {
    if (isDesktop(context)) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: $constants.insets.xs),
          child: SizedBox(
            height: getSize(context).height * 0.7,
            width: getSize(context).width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.md),
              child: AddFolderModal(
                folder: folder,
              ),
            ),
          ),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SizedBox(
          height: getSize(context).height * 0.8,
          child: AddFolderModal(
            folder: folder,
          ),
        ),
      );
    }
  }
}
