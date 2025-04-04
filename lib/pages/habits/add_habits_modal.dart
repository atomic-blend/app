import 'package:app/components/buttons/date_picker_button.dart';
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
  final TextEditingController _emojiController = TextEditingController();
  final TextEditingController _citationController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    if (widget.habit != null) {
      _nameController.text = widget.habit!.name ?? '';
      _emojiController.text = widget.habit!.emoji ?? '';
      _citationController.text = widget.habit!.citation ?? '';
      _startDate = widget.habit!.startDate;
      _endDate = widget.habit!.endDate;
    } else {
      _startDate = DateTime.now();
    }
    super.initState();
  }

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
                  height: $constants.insets.md,
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
                  trailing: Padding(
                    padding: EdgeInsets.only(right: $constants.insets.xs),
                    child: GestureDetector(
                      child: const Icon(CupertinoIcons.smiley),
                    ),
                  ),
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                AppTextFormField(
                  controller: _citationController,
                  labelText: context.t.habits.add.citation,
                  hintText: context.t.habits.add.citation_hint,
                  labelDescription: context.t.habits.add.citation_description,
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                Row(
                  children: [
                    DatePickerButton(
                      title: context
                          .t.habits.add.when_would_you_like_the_habit_to_start,
                      label: context.t.habits.add.start_date,
                      date: _startDate,
                      onDateChanged: (value) {
                        setState(() {
                          _startDate = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    DatePickerButton(
                      title: context
                          .t.habits.add.when_would_you_like_the_habit_to_end,
                      label: context.t.habits.add.end_date,
                      date: _endDate,
                      onDateChanged: (value) {
                        setState(() {
                          _endDate = value;
                        });
                      },
                    )
                  ],
                )
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
