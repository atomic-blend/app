import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/components/buttons/date_picker_button.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/dialogs/date_picker_dialog.dart';
import 'package:app/components/dialogs/multiple_date_picker_dialog.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:jiffy/jiffy.dart';

class AddHabitModal extends StatefulWidget {
  final Habit? habit;
  final VoidCallback? onEditEnd;
  const AddHabitModal({super.key, this.habit, this.onEditEnd});

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
  String? _daysOfWeekError;
  List<DateTime>? _daysOfMonth = [];
  String? _daysOfMonthError;
  bool _showEmojiPicker = false;
  List<String>? _reminders = [];
  Duration? _duration;

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
      _daysOfMonth = widget.habit!.daysOfMonth;
      _reminders = widget.habit!.reminders;
      _duration = widget.habit!.duration;
    } else {
      _startDate = DateTime.now();
      _frequency = ALLOWED_FREQUENCIES[0];
      _numberOfTimes = 1;
      _daysOfWeek = [];
      _daysOfMonth = [];
      _reminders = [];
      _duration = const Duration(minutes: 5);
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
    return BlocListener<HabitBloc, HabitState>(
      listener: (BuildContext context, HabitState state) {
        if (state is HabitCreated) {
          Navigator.pop(context);
        }
      },
      child: Container(
        height: getSize(context).height * 0.88,
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.md, vertical: $constants.insets.sm),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: $constants.insets.xxs,
                    ),
                    Row(
                      children: [
                        if (widget.onEditEnd != null) ...[
                          GestureDetector(
                            onTap: () {
                              widget.onEditEnd?.call();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    $constants.corners.full),
                              ),
                              child: const Icon(
                                CupertinoIcons.back,
                                size: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: $constants.insets.sm,
                          ),
                        ],
                        Expanded(
                          child: AutoSizeText(
                            maxLines: 1,
                            context.t.habits.add.title,
                            style:
                                getTextTheme(context).headlineLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        SizedBox(
                          width: $constants.insets.sm,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: getTheme(context).surfaceContainer,
                              borderRadius: BorderRadius.circular(
                                  $constants.corners.full),
                            ),
                            padding: EdgeInsets.all($constants.insets.xs),
                            child: const Icon(
                              CupertinoIcons.xmark,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
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
                    SizedBox(
                      height: $constants.insets.md,
                    ),
                    CustomPopup(
                      content: SizedBox(
                          width: getSize(context).width * 0.6,
                          height: getSize(context).height * 0.25,
                          child: CupertinoTimerPicker(
                              initialTimerDuration:
                                  _duration ?? const Duration(),
                              mode: CupertinoTimerPickerMode.hm,
                              onTimerDurationChanged: (newDuration) {
                                setState(() {
                                  _duration = newDuration;
                                });
                              })),
                      child: AppTextFormField(
                        controller: TextEditingController(
                          text:
                              "${_duration?.inHours != 0 ? "${_duration?.inHours}:" : ""}${_duration?.inMinutes.remainder(60)} ${context.t.time_units.long.minute(n: _duration?.inMinutes.remainder(60) ?? 0)}",
                        ),
                        disabled: true,
                        labelText: context.t.habits.add.duration_label,
                        hintText: context.t.habits.add.duration_hint,
                        labelDescription:
                            context.t.habits.add.duration_description,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.t.habits.add.name_required;
                          }
                          return null;
                        },
                      ),
                    ),
                    if (_showEmojiPicker)
                      SizedBox(
                        height: 250,
                        child: EmojiPicker(
                          onEmojiSelected: _onEmojiSelected,
                          textEditingController: _emojiController,
                          config: Config(
                              locale: AppLocaleUtils.findDeviceLocale()
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
                                backgroundColor:
                                    getTheme(context).surfaceContainer,
                                indicatorColor: getTheme(context).primary,
                                iconColor: Colors.grey,
                                iconColorSelected: getTheme(context).primary,
                                categoryIcons: const CategoryIcons(),
                              ),
                              bottomActionBarConfig: BottomActionBarConfig(
                                enabled: false,
                                backgroundColor:
                                    getTheme(context).surfaceContainer,
                                buttonColor: Colors.grey,
                                buttonIconColor: Colors.white,
                              ),
                              searchViewConfig: SearchViewConfig(
                                hintText:
                                    context.t.habits.add.search_emoji_hint,
                              )),
                        ),
                      ),
                    SizedBox(
                      height: $constants.insets.md,
                    ),
                    AppTextFormField(
                      controller: _citationController,
                      labelText: context.t.habits.add.citation,
                      hintText: context.t.habits.add.citation_hint,
                      labelDescription:
                          context.t.habits.add.citation_description,
                    ),
                    SizedBox(
                      height: $constants.insets.md,
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
                          title: context.t.habits.add
                              .when_would_you_like_the_habit_to_end,
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
                    SizedBox(
                      height: $constants.insets.md,
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
                            indicatorSize: Size.fromWidth(
                                getSize(context).width * 0.4 / 2),
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
                                    ? getTheme(context).surfaceContainerLow
                                    : getTheme(context).surfaceContainer,
                                backgroundColor:
                                    getTheme(context).surfaceContainer,
                              );
                            },
                            onChanged: (value) {
                              setState(() {
                                _frequency = value;
                              });
                              _daysOfWeekError = null;
                            },
                          ),
                        ),
                      ],
                    ),
                    // numberOfTimes int selector
                    if (_frequency == "daily" ||
                        _frequency == "weekly" ||
                        _frequency == "monthly") ...[
                      SizedBox(
                        height: $constants.insets.md,
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
                        borderRadius:
                            BorderRadius.circular($constants.corners.md),
                        child: InputQty(
                          maxVal: 100,
                          initVal: _numberOfTimes!,
                          minVal: 0,
                          steps: 1,
                          decoration: QtyDecorationProps(
                            fillColor: getTheme(context).surfaceContainer,
                            plusBtn: Padding(
                              padding:
                                  EdgeInsets.only(right: $constants.insets.xs),
                              child: const Icon(CupertinoIcons.add),
                            ),
                            minusBtn: Padding(
                              padding:
                                  EdgeInsets.only(left: $constants.insets.xs),
                              child: const Icon(CupertinoIcons.minus),
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
                    ],
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                    // daysOfWeek selector for the habit if it's daily
                    if (_frequency == "daily" || _frequency == "weekly") ...[
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
                            _getMultiSelectItem(
                                0,
                                _daysOfWeek?.contains(0) ?? false,
                                context.t.days_of_week["monday"]!),
                            _getMultiSelectItem(
                                1,
                                _daysOfWeek?.contains(1) ?? false,
                                context.t.days_of_week["tuesday"]!),
                            _getMultiSelectItem(
                                2,
                                _daysOfWeek?.contains(2) ?? false,
                                context.t.days_of_week["wednesday"]!),
                            _getMultiSelectItem(
                                3,
                                _daysOfWeek?.contains(3) ?? false,
                                context.t.days_of_week["thursday"]!),
                            _getMultiSelectItem(
                                4,
                                _daysOfWeek?.contains(4) ?? false,
                                context.t.days_of_week["friday"]!),
                            _getMultiSelectItem(
                                5,
                                _daysOfWeek?.contains(5) ?? false,
                                context.t.days_of_week["saturday"]!),
                            _getMultiSelectItem(
                                6,
                                _daysOfWeek?.contains(6) ?? false,
                                context.t.days_of_week["sunday"]!),
                          ],
                          onChange: (allSelectedItems, selectedItem) {
                            setState(() {
                              _daysOfWeek = allSelectedItems;
                            });
                          }),
                      if (_daysOfWeekError != null)
                        Padding(
                          padding: EdgeInsets.only(left: $constants.insets.xs),
                          child: Text(_daysOfWeekError!,
                              style: getTextTheme(context).bodySmall!.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  )),
                        ),
                    ],
                    if (_frequency == "monthly") ...[
                      SizedBox(
                        height: $constants.insets.md,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: $constants.insets.xs),
                        child: AutoSizeText(
                          maxLines: 1,
                          context.t.habits.add.days_of_month_title,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: $constants.insets.xs),
                        child: AutoSizeText(
                          context.t.habits.add.days_of_month_description,
                          style: getTextTheme(context)
                              .bodySmall!
                              .copyWith(color: Colors.grey[700]),
                        ),
                      ),
                      if (_daysOfMonth != null && _daysOfMonth!.isNotEmpty)
                        Row(
                          children: _daysOfMonth!
                              .map((e) => Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: $constants.insets.sm,
                                            vertical: $constants.insets.sm),
                                        child: Text(Jiffy.parseFromDateTime(e)
                                            .format(pattern: "EEEE dd")),
                                      ),
                                      Positioned(
                                          right: 0,
                                          top: 3,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _daysOfMonth?.remove(e);
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: getTheme(context).error,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        $constants.corners.md),
                                              ),
                                              padding: const EdgeInsets.all(2),
                                              child: Icon(
                                                CupertinoIcons.xmark,
                                                color:
                                                    getTheme(context).surface,
                                                size: 12,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ))
                              .toList(),
                        ),
                      if (_daysOfMonthError != null)
                        Padding(
                          padding: EdgeInsets.only(left: $constants.insets.xs),
                          child: Text(_daysOfMonthError!,
                              style: getTextTheme(context).bodySmall!.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  )),
                        ),
                      SizedBox(
                        height: $constants.insets.sm,
                      ),
                      Center(
                        child: PrimaryButtonSquare(
                          height: getSize(context).height * 0.04,
                          width: getSize(context).width * 0.5,
                          text: context.t.habits.add.select_days,
                          outlined: true,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    ABMultupleDatePickerDialog(
                                      title: context.t.habits.add.select_days,
                                      onDateChanged: (value) {
                                        setState(() {
                                          _daysOfMonth = value;
                                        });
                                      },
                                    ));
                          },
                        ),
                      )
                    ],
                    if (_frequency == "repeatition") ...[
                      Padding(
                        padding: EdgeInsets.only(left: $constants.insets.xs),
                        child: AutoSizeText(
                          maxLines: 1,
                          context.t.habits.add.every_number_day_title,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: $constants.insets.xs),
                        child: AutoSizeText(
                          context.t.habits.add.every_number_day_description,
                          style: getTextTheme(context)
                              .bodySmall!
                              .copyWith(color: Colors.grey[700]),
                        ),
                      ),
                      SizedBox(
                        height: $constants.insets.xxs,
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular($constants.corners.md),
                        child: InputQty(
                          maxVal: 100,
                          initVal: _numberOfTimes!,
                          minVal: 0,
                          steps: 1,
                          decoration: QtyDecorationProps(
                            fillColor: getTheme(context).surfaceContainer,
                            plusBtn: Padding(
                              padding:
                                  EdgeInsets.only(right: $constants.insets.xs),
                              child: const Icon(CupertinoIcons.add),
                            ),
                            minusBtn: Padding(
                              padding:
                                  EdgeInsets.only(left: $constants.insets.xs),
                              child: const Icon(CupertinoIcons.minus),
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
                    ],
                    SizedBox(
                      height: $constants.insets.xs,
                    ),
                    // reminders selector (list of times)
                    Padding(
                      padding: EdgeInsets.only(left: $constants.insets.xs),
                      child: AutoSizeText(
                        maxLines: 1,
                        context.t.habits.add.reminders_label,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: $constants.insets.xs),
                      child: AutoSizeText(
                        context.t.habits.add.reminders_description,
                        style: getTextTheme(context)
                            .bodySmall!
                            .copyWith(color: Colors.grey[700]),
                      ),
                    ),
                    Row(
                      children: [
                        ...(_reminders ?? []).map(
                          (e) => Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: $constants.insets.xs,
                                    vertical: $constants.insets.xs),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: getTheme(context).surfaceContainer,
                                    borderRadius: BorderRadius.circular(
                                        $constants.corners.md),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: $constants.insets.xs,
                                      vertical: $constants.insets.xs),
                                  child: Text(Jiffy.parseFromDateTime(
                                    DateTime.utc(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(e.split(":")[0]),
                                      int.parse(e.split(":")[1]),
                                    ),
                                  ).toLocal().Hm),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  top: 3,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _reminders?.remove(e);
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: getTheme(context).error,
                                        borderRadius: BorderRadius.circular(
                                            $constants.corners.md),
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: Icon(
                                        CupertinoIcons.xmark,
                                        color: getTheme(context).surface,
                                        size: 12,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: $constants.insets.md,
                    ),
                    Center(
                      child: PrimaryButtonSquare(
                        width: getSize(context).width * 0.4,
                        text: context.t.habits.add.reminders_add,
                        outlined: true,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => ABDatePickerDialog(
                                  initialDate: _startDate,
                                  title: context.t.tasks.add_task_modal
                                      .when_would_you_like_to_be_reminded,
                                  onDateChanged: (value) {
                                    setState(() {
                                      _reminders?.add(
                                          "${value.hour}:${value.minute}");
                                    });
                                  }));
                        },
                      ),
                    )
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

                    if ((_frequency == "weekly") &&
                        _daysOfWeek?.length != _numberOfTimes) {
                      setState(() {
                        _daysOfWeekError =
                            context.t.habits.add.days_of_week_mismatch;
                      });
                      return;
                    }

                    if (_frequency == "monthly" &&
                        _daysOfMonth?.length != _numberOfTimes) {
                      setState(() {
                        _daysOfMonthError =
                            context.t.habits.add.days_of_week_mismatch;
                      });
                      return;
                    }
                    _createOrEditHabit(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _createOrEditHabit(BuildContext context) {
    final habit = Habit(
      name: _nameController.text,
      emoji: _emojiController.text,
      citation: _citationController.text,
      startDate: _startDate,
      endDate: _endDate,
      frequency: _frequency,
      numberOfTimes: _numberOfTimes,
      daysOfWeek: _daysOfWeek,
      daysOfMonth: _daysOfMonth,
      reminders: _reminders,
      duration: _duration,
    );

    if (widget.habit == null) {
      context.read<HabitBloc>().add(CreateHabit(habit));
    } else {
      context
          .read<HabitBloc>()
          .add(UpdateHabit(habit.copyWith(id: widget.habit!.id)));
      widget.onEditEnd?.call();
    }
  }

  MultiSelectCard<int> _getMultiSelectItem(
      int value, bool selected, String label) {
    return MultiSelectCard<int>(
        value: value,
        selected: selected,
        decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
          color: getTheme(context).surfaceContainer,
          borderRadius: BorderRadius.circular($constants.corners.full),
        )),
        label: label);
  }
}
