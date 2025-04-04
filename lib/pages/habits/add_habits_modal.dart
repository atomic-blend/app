import 'package:animated_toggle_switch/animated_toggle_switch.dart';
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
  final ALLOWED_FREQUENCIES = [
    'daily',
    'weekly',
    'monthly',
    'repeatition',
  ];
  DateTime? _startDate;
  DateTime? _endDate;
  String? _frequency;

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
      _frequency = ALLOWED_FREQUENCIES[0];
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
                ),
                // frequency switch
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: $constants.insets.xs),
                      child: AutoSizeText(
                        maxLines: 1,
                        context.t.habits.add.frequency_label!,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: AnimatedToggleSwitch<String?>.rolling(
                        current: _frequency,
                        indicatorSize:
                            Size.fromWidth(getSize(context).width * 0.4 / 2),
                        values: ALLOWED_FREQUENCIES,
                        iconBuilder: (value, foreground) {
                          return AutoSizeText(
                              maxLines: 1,
                              context.t.habits.add.frequency[value]!,
                              style:
                                  getTextTheme(context).bodyMedium!.copyWith());
                        },
                        styleBuilder: (value) {
                          return ToggleStyle(
                            borderColor: Colors.transparent,
                            indicatorColor: value == _frequency
                                ? getTheme(context).surface
                                : getTheme(context).surfaceContainer,
                            backgroundColor: getTheme(context).surfaceContainer,
                          );
                        },
                        onChanged: (value) {
                          setState(() {
                            _frequency = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                //TODO: numberOfTimes int selector
                //TODO: daysOfWeek selector for the habit if it's daily
                //TODO: reminders selector (list of times)
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
