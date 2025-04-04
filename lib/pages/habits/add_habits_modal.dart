import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/components/buttons/date_picker_button.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:input_quantity/input_quantity.dart';

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
  int? _numberOfTimes;
  List<int>? _daysOfWeek = [];
  bool _showEmojiPicker = false;

  @override
  void initState() {
    if (widget.habit != null) {
      _nameController.text = widget.habit!.name ?? '';
      _emojiController.text = widget.habit!.emoji ?? '';
      _citationController.text = widget.habit!.citation ?? '';
      _startDate = widget.habit!.startDate;
      _endDate = widget.habit!.endDate;
      _frequency = widget.habit!.frequency;
      _numberOfTimes = widget.habit!.numberOfTimes;
      _daysOfWeek = widget.habit!.daysOfWeek;
    } else {
      _startDate = DateTime.now();
      _frequency = ALLOWED_FREQUENCIES[0];
      _numberOfTimes = 0;
      _daysOfWeek = [];
    }
    super.initState();
  }

  void _toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
  }

  void _onEmojiSelected(Category? category, Emoji emoji) {
    setState(() {
      _emojiController.text = emoji.emoji;
      _showEmojiPicker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(context).height * 0.88,
      padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm, vertical: $constants.insets.xs),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        onTap: _toggleEmojiPicker,
                        child: _emojiController.text.isEmpty
                            ? const Icon(CupertinoIcons.smiley)
                            : Center(
                                child: Text(
                                  _emojiController.text,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                      ),
                    ),
                  ),
                  if (_showEmojiPicker)
                    SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        onEmojiSelected: _onEmojiSelected,
                        textEditingController: _emojiController,
                        config: Config(
                            locale:
                                AppLocaleUtils.findDeviceLocale().flutterLocale,
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
                              backgroundColor:
                                  getTheme(context).surfaceContainerLow,
                              indicatorColor: getTheme(context).primary,
                              iconColor: Colors.grey,
                              iconColorSelected: getTheme(context).primary,
                              categoryIcons: const CategoryIcons(),
                            ),
                            bottomActionBarConfig: BottomActionBarConfig(
                              enabled: false,
                              backgroundColor:
                                  getTheme(context).surfaceContainerLow,
                              buttonColor: Colors.grey,
                              buttonIconColor: Colors.white,
                            ),
                            searchViewConfig: SearchViewConfig(
                              hintText: context.t.habits.add.search_emoji_hint,
                            )),
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
                        title: context.t.habits.add
                            .when_would_you_like_the_habit_to_start,
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
                          context.t.habits.add.frequency_label,
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
                                style: getTextTheme(context)
                                    .bodyMedium!
                                    .copyWith());
                          },
                          styleBuilder: (value) {
                            return ToggleStyle(
                              borderColor: Colors.transparent,
                              indicatorColor: value == _frequency
                                  ? getTheme(context).surface
                                  : getTheme(context).surfaceContainer,
                              backgroundColor:
                                  getTheme(context).surfaceContainer,
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
                  // numberOfTimes int selector
                  SizedBox(
                    height: $constants.insets.sm,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: $constants.insets.xs),
                    child: AutoSizeText(
                      maxLines: 1,
                      context.t.habits.add.number_of_times_label,
                      style: getTextTheme(context).bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: $constants.insets.xs),
                    child: AutoSizeText(
                      context.t.habits.add.number_of_times_description,
                      style: getTextTheme(context)
                          .bodySmall!
                          .copyWith(color: Colors.grey[700]),
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.xxs,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular($constants.corners.md),
                    child: InputQty(
                      maxVal: 100,
                      initVal: _numberOfTimes!,
                      minVal: 0,
                      steps: 1,
                      decoration: QtyDecorationProps(
                        fillColor: getTheme(context).surfaceContainerHigh,
                        plusBtn: Padding(
                          padding: EdgeInsets.only(right: $constants.insets.xs),
                          child: const Icon(CupertinoIcons.add),
                        ),
                        minusBtn: Padding(
                          padding: EdgeInsets.only(left: $constants.insets.xs),
                          child: Icon(CupertinoIcons.minus),
                        ),
                        isBordered: false,
                        isDense: true,
                      ),
                      onQtyChanged: (val) {
                        setState(() {
                          _numberOfTimes = val.toInt();
                        });
                      },
                    ),
                  ),

                  // daysOfWeek selector for the habit if it's daily
                  if (_frequency == "daily") ...[
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: $constants.insets.xs),
                      child: AutoSizeText(
                        maxLines: 1,
                        context.t.habits.add.days_of_week_label,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: $constants.insets.xs),
                      child: AutoSizeText(
                        context.t.habits.add.days_of_week_description,
                        style: getTextTheme(context)
                            .bodySmall!
                            .copyWith(color: Colors.grey[700]),
                      ),
                    ),
                    SizedBox(
                      height: $constants.insets.xxs,
                    ),
                    MultiSelectContainer(
                        items: [
                          MultiSelectCard(
                              value: 0,
                              label: context.t.days_of_week["monday"]!),
                          MultiSelectCard(
                              value: 1,
                              label: context.t.days_of_week["tuesday"]!),
                          MultiSelectCard(
                              value: 2,
                              label: context.t.days_of_week["wednesday"]!),
                          MultiSelectCard(
                              value: 3,
                              label: context.t.days_of_week["thursday"]!),
                          MultiSelectCard(
                              value: 4,
                              label: context.t.days_of_week["friday"]!),
                          MultiSelectCard(
                              value: 5,
                              label: context.t.days_of_week["saturday"]!),
                          MultiSelectCard(
                              value: 6,
                              label: context.t.days_of_week["sunday"]!),
                        ],
                        onChange: (allSelectedItems, selectedItem) {
                          setState(() {
                            _daysOfWeek = allSelectedItems;
                          });
                        }),
                  ]
                  //TODO: reminders selector (list of times)
                ],
              ),
            ),
            SizedBox(
              height: $constants.insets.md,
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
      ),
    );
  }
}
