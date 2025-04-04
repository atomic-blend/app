import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddHabitModal extends StatefulWidget {
  final Habit? habit;
  const AddHabitModal({super.key, this.habit});

  @override
  State<AddHabitModal> createState() => _AddHabitModalState();
}

class _AddHabitModalState extends State<AddHabitModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(context).height * 0.88,
      padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm, vertical: $constants.insets.xs),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.arrow_left))
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xxs,
                ),
                AutoSizeText(
                  maxLines: 1,
                  context.t.habits.add.title,
                  style: getTextTheme(context).headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: $constants.insets.xxl,
                ),
                AppTextFormField(
                  controller: _nameController,
                  labelText: context.t.habits.add.name,
                  hintText: context.t.habits.add.name_hint,
                  labelDescription: context.t.habits.add.name_description,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.t.habits.add.name_required;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: $constants.insets.lg),
            child: PrimaryButtonSquare(
              text: context.t.actions.save,
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
