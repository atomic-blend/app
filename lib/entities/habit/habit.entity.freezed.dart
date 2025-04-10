// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  set userId(String? value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  set emoji(String? value) => throw _privateConstructorUsedError;
  String? get citation => throw _privateConstructorUsedError;
  set citation(String? value) => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  set startDate(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  set endDate(DateTime? value) => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  set frequency(String? value) => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;
  set duration(Duration? value) => throw _privateConstructorUsedError;
  int? get numberOfTimes => throw _privateConstructorUsedError;
  set numberOfTimes(int? value) => throw _privateConstructorUsedError;
  List<int>? get daysOfWeek => throw _privateConstructorUsedError;
  set daysOfWeek(List<int>? value) => throw _privateConstructorUsedError;
  List<DateTime>? get daysOfMonth => throw _privateConstructorUsedError;
  set daysOfMonth(List<DateTime>? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;
  List<String>? get reminders => throw _privateConstructorUsedError;
  set reminders(List<String>? value) => throw _privateConstructorUsedError;
  List<HabitEntry>? get entries => throw _privateConstructorUsedError;
  set entries(List<HabitEntry>? value) => throw _privateConstructorUsedError;

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? emoji,
      String? citation,
      DateTime? startDate,
      DateTime? endDate,
      String? frequency,
      Duration? duration,
      int? numberOfTimes,
      List<int>? daysOfWeek,
      List<DateTime>? daysOfMonth,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<String>? reminders,
      List<HabitEntry>? entries});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? emoji = freezed,
    Object? citation = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? numberOfTimes = freezed,
    Object? daysOfWeek = freezed,
    Object? daysOfMonth = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reminders = freezed,
    Object? entries = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      citation: freezed == citation
          ? _value.citation
          : citation // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      numberOfTimes: freezed == numberOfTimes
          ? _value.numberOfTimes
          : numberOfTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      daysOfWeek: freezed == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      daysOfMonth: freezed == daysOfMonth
          ? _value.daysOfMonth
          : daysOfMonth // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reminders: freezed == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HabitEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitImplCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$HabitImplCopyWith(
          _$HabitImpl value, $Res Function(_$HabitImpl) then) =
      __$$HabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? emoji,
      String? citation,
      DateTime? startDate,
      DateTime? endDate,
      String? frequency,
      Duration? duration,
      int? numberOfTimes,
      List<int>? daysOfWeek,
      List<DateTime>? daysOfMonth,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<String>? reminders,
      List<HabitEntry>? entries});
}

/// @nodoc
class __$$HabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$HabitImpl>
    implements _$$HabitImplCopyWith<$Res> {
  __$$HabitImplCopyWithImpl(
      _$HabitImpl _value, $Res Function(_$HabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? emoji = freezed,
    Object? citation = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? numberOfTimes = freezed,
    Object? daysOfWeek = freezed,
    Object? daysOfMonth = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reminders = freezed,
    Object? entries = freezed,
  }) {
    return _then(_$HabitImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      citation: freezed == citation
          ? _value.citation
          : citation // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      numberOfTimes: freezed == numberOfTimes
          ? _value.numberOfTimes
          : numberOfTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      daysOfWeek: freezed == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      daysOfMonth: freezed == daysOfMonth
          ? _value.daysOfMonth
          : daysOfMonth // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reminders: freezed == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HabitEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitImpl extends _Habit {
  _$HabitImpl(
      {this.id,
      this.userId,
      this.name,
      this.emoji,
      this.citation,
      this.startDate,
      this.endDate,
      this.frequency,
      this.duration,
      this.numberOfTimes,
      this.daysOfWeek,
      this.daysOfMonth,
      this.createdAt,
      this.updatedAt,
      this.reminders,
      this.entries})
      : super._();

  factory _$HabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitImplFromJson(json);

  @override
  String? id;
  @override
  String? userId;
  @override
  String? name;
  @override
  String? emoji;
  @override
  String? citation;
  @override
  DateTime? startDate;
  @override
  DateTime? endDate;
  @override
  String? frequency;
  @override
  Duration? duration;
  @override
  int? numberOfTimes;
  @override
  List<int>? daysOfWeek;
  @override
  List<DateTime>? daysOfMonth;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;
  @override
  List<String>? reminders;
  @override
  List<HabitEntry>? entries;

  @override
  String toString() {
    return 'Habit(id: $id, userId: $userId, name: $name, emoji: $emoji, citation: $citation, startDate: $startDate, endDate: $endDate, frequency: $frequency, duration: $duration, numberOfTimes: $numberOfTimes, daysOfWeek: $daysOfWeek, daysOfMonth: $daysOfMonth, createdAt: $createdAt, updatedAt: $updatedAt, reminders: $reminders, entries: $entries)';
  }

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      __$$HabitImplCopyWithImpl<_$HabitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitImplToJson(
      this,
    );
  }
}

abstract class _Habit extends Habit {
  factory _Habit(
      {String? id,
      String? userId,
      String? name,
      String? emoji,
      String? citation,
      DateTime? startDate,
      DateTime? endDate,
      String? frequency,
      Duration? duration,
      int? numberOfTimes,
      List<int>? daysOfWeek,
      List<DateTime>? daysOfMonth,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<String>? reminders,
      List<HabitEntry>? entries}) = _$HabitImpl;
  _Habit._() : super._();

  factory _Habit.fromJson(Map<String, dynamic> json) = _$HabitImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get userId;
  set userId(String? value);
  @override
  String? get name;
  set name(String? value);
  @override
  String? get emoji;
  set emoji(String? value);
  @override
  String? get citation;
  set citation(String? value);
  @override
  DateTime? get startDate;
  set startDate(DateTime? value);
  @override
  DateTime? get endDate;
  set endDate(DateTime? value);
  @override
  String? get frequency;
  set frequency(String? value);
  @override
  Duration? get duration;
  set duration(Duration? value);
  @override
  int? get numberOfTimes;
  set numberOfTimes(int? value);
  @override
  List<int>? get daysOfWeek;
  set daysOfWeek(List<int>? value);
  @override
  List<DateTime>? get daysOfMonth;
  set daysOfMonth(List<DateTime>? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);
  @override
  List<String>? get reminders;
  set reminders(List<String>? value);
  @override
  List<HabitEntry>? get entries;
  set entries(List<HabitEntry>? value);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
