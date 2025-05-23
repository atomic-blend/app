import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/ab_color_picker.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/components/modals/delete_confirm_modal.dart';
import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';

class AddFolderModal extends StatefulWidget {
  final Folder? folder;
  const AddFolderModal({super.key, this.folder});

  @override
  State<AddFolderModal> createState() => _AddFolderModalState();
}

class _AddFolderModalState extends State<AddFolderModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  Color? _color;

  final TextEditingController _emojiController = TextEditingController();
  bool _showEmojiPicker = false;

  @override
  void initState() {
    if (widget.folder != null) {
      _nameController.text = widget.folder!.name;
      _color = widget.folder!.color != null
          ? hexToColor(widget.folder!.color!)
          : null;
    } else {
      _color = Colors.blue;
    }
    super.initState();
  }

  void _onEmojiSelected(Category? category, Emoji emoji) {
    setState(() {
      _emojiController.text = emoji.emoji;
      _showEmojiPicker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FolderBloc, FolderState>(
      listener: (BuildContext context, FolderState state) {
        if (state is FolderCreated || state is FolderUpdated) {
          Navigator.pop(context);
        }
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular($constants.corners.lg),
              topRight: Radius.circular($constants.corners.lg),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.md,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: AutoSizeText(
                        maxLines: 1,
                        widget.folder == null
                            ? context.t.tasks.folders.add_folder
                            : context.t.tasks.folders.edit_folder,
                        style: getTextTheme(context).titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            controller: _nameController,
                            labelText: context.t.tasks.folders.name,
                            hintText: context.t.tasks.folders.name_hint,
                            labelDescription:
                                context.t.tasks.folders.name_description,
                            trailing: CustomPopup(
                                content: SizedBox(
                                  height: 250,
                                  width: isDesktop(context)
                                      ? 500
                                      : double.infinity,
                                  child: EmojiPicker(
                                    onEmojiSelected: _onEmojiSelected,
                                    textEditingController: _emojiController,
                                    config: Config(
                                        locale:
                                            AppLocaleUtils.findDeviceLocale()
                                                .flutterLocale,
                                        emojiViewConfig: const EmojiViewConfig(
                                          emojiSizeMax: 32.0,
                                          verticalSpacing: 0,
                                          horizontalSpacing: 0,
                                          gridPadding: EdgeInsets.zero,
                                          recentsLimit: 28,
                                          replaceEmojiOnLimitExceed: true,
                                          buttonMode: ButtonMode.CUPERTINO,
                                          loadingIndicator: SizedBox.shrink(),
                                        ),
                                        categoryViewConfig: CategoryViewConfig(
                                          initCategory: Category.SMILEYS,
                                          extraTab: CategoryExtraTab.SEARCH,
                                          tabIndicatorAnimDuration:
                                              const Duration(milliseconds: 300),
                                          backgroundColor: getTheme(context)
                                              .surfaceContainer,
                                          indicatorColor:
                                              getTheme(context).primary,
                                          iconColor: Colors.grey,
                                          iconColorSelected:
                                              getTheme(context).primary,
                                          categoryIcons: const CategoryIcons(),
                                        ),
                                        bottomActionBarConfig:
                                            BottomActionBarConfig(
                                          enabled: false,
                                          backgroundColor: getTheme(context)
                                              .surfaceContainer,
                                          buttonColor: Colors.grey,
                                          buttonIconColor: Colors.white,
                                        ),
                                        searchViewConfig: SearchViewConfig(
                                          hintText: context
                                              .t.habits.add.search_emoji_hint,
                                        )),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: $constants.insets.xs),
                                  child: _emojiController.text != ""
                                      ? Center(
                                          child: Text(
                                            _emojiController.text,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                      : Icon(
                                          CupertinoIcons.smiley,
                                          color: _showEmojiPicker
                                              ? getTheme(context).primary
                                              : getTheme(context)
                                                  .onSurface
                                                  .withValues(alpha: 0.5),
                                        ),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.t.tasks.folders.name_required;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: $constants.insets.sm,
                          ),
                          AbColorPicker(
                            color: _color,
                            labelText: context.t.tasks.folders.color,
                            labelDescription:
                                context.t.tasks.folders.color_description,
                            onColorChanged: (color) {
                              setState(() {
                                _color = color;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        if (widget.folder != null)
                          TextButton(
                              onPressed: () async {
                                await showDialog(
                                    context: context,
                                    builder: (context) => DeleteConfirmModal(
                                          title: context
                                              .t.tasks.folders.delete_folder,
                                          description: context.t.tasks.folders
                                              .delete_folder_description,
                                          warning: context.t.tasks.folders
                                              .delete_folder_warning,
                                          onDelete: () {
                                            if (!context.mounted) return;
                                            context
                                                .read<FolderBloc>()
                                                .add(DeleteFolder(
                                                  widget.folder!,
                                                ));
                                          },
                                        ));
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              },
                              child: Text(
                                context.t.actions.delete,
                                style: getTextTheme(context)
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: getTheme(context).error),
                              )),
                        PrimaryButtonSquare(
                          text: widget.folder == null
                              ? context.t.actions.add
                              : context.t.actions.save,
                          onPressed: () {
                            if (_formKey.currentState?.validate() != true) {
                              return;
                            }
                            if (widget.folder == null) {
                              final folder = Folder(
                                  name: _nameController.text,
                                  color: _color?.hexCode);

                              context.read<FolderBloc>().add(
                                    AddFolder(
                                      folder,
                                    ),
                                  );
                            } else {
                              final folder = widget.folder!.copyWith(
                                name: _nameController.text,
                                color: _color?.hexCode,
                                emoji: _emojiController.text,
                              );
                              context.read<FolderBloc>().add(
                                    EditFolder(
                                      folder,
                                    ),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                  ],
                ),
                Positioned(
                  left: $constants.insets.xxs,
                  top: $constants.insets.xxs,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      isDesktop(context)
                          ? CupertinoIcons.xmark
                          : CupertinoIcons.back,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
