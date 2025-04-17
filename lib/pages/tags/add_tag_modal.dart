import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/ab_color_picker.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/components/modals/delete_confirm_modal.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTagModal extends StatefulWidget {
  final TagEntity? tag;
  const AddTagModal({super.key, this.tag});

  @override
  State<AddTagModal> createState() => _AddTagModalState();
}

class _AddTagModalState extends State<AddTagModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  Color? _color;

  @override
  void initState() {
    if (widget.tag != null) {
      _nameController.text = widget.tag!.name;
      _color =
          widget.tag!.color != null ? hexToColor(widget.tag!.color!) : null;
    } else {
      _color = Colors.blue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TagBloc, TagState>(
      listener: (BuildContext context, TagState state) {
        if (state is TagCreateSuccess || state is TagEditSuccess) {
          Navigator.pop(context);
        }
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).viewInsets.bottom +
            getSize(context).height * 0.88,
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
                      widget.tag == null
                          ? context.t.tags.add_modal.title
                          : context.t.tags.add_modal.edit_title,
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
                          labelText: context.t.tags.add_modal.name,
                          hintText: context.t.tags.add_modal.name_hint,
                          labelDescription:
                              context.t.tags.add_modal.name_description,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.t.tags.add_modal.name_required;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: $constants.insets.sm,
                        ),
                        AbColorPicker(
                          color: _color,
                          labelText: context.t.tags.add_modal.color,
                          labelDescription:
                              context.t.tags.add_modal.color_description,
                          onColorChanged: (color) {
                            setState(() {
                              _color = color;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      if (widget.tag != null)
                        TextButton(
                            onPressed: () async {
                              await showDialog(
                                  context: context,
                                  builder: (context) => DeleteConfirmModal(
                                        title: context.t.tags.delete.title,
                                        description:
                                            context.t.tags.delete.description,
                                        warning: context.t.tags.delete.warning,
                                        onDelete: () {
                                          context
                                              .read<TagBloc>()
                                              .add(DeleteTag(widget.tag!.id!));
                                        },
                                      ));
                              if (!context.mounted) return;
                              Navigator.pop(context);
                            },
                            child: Text(
                              context.t.actions.delete,
                              style: getTextTheme(context).bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: getTheme(context).error),
                            )),
                      PrimaryButtonSquare(
                        text: widget.tag == null
                            ? context.t.actions.add
                            : context.t.actions.save,
                        onPressed: () {
                          if (_formKey.currentState?.validate() != true) {
                            return;
                          }
                          if (widget.tag == null) {
                            final tag = TagEntity(
                                name: _nameController.text,
                                color: _color?.hexCode);

                            context.read<TagBloc>().add(
                                  CreateTag(
                                    tag,
                                  ),
                                );
                          } else {
                            context.read<TagBloc>().add(
                                  EditTag(
                                    widget.tag!.copyWith(
                                      name: _nameController.text,
                                      color: _color?.hexCode,
                                    ),
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
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
