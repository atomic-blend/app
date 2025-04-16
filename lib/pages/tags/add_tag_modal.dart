import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/ab_color_picker.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTagModal extends StatefulWidget {
  const AddTagModal({super.key});

  @override
  State<AddTagModal> createState() => _AddTagModalState();
}

class _AddTagModalState extends State<AddTagModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  Color? _color;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    context.t.tags.add_modal.title,
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
                PrimaryButtonSquare(text: context.t.actions.add),
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
    );
  }
}
