// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_entry.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeEntry _$TimeEntryFromJson(Map<String, dynamic> json) {
  return _TimeEntry.fromJson(json);
}

/// @nodoc
mixin _$TimeEntry {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;
  set taskId(String? value) => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  set startDate(DateTime value) => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  set endDate(DateTime value) =>
      throw _privateConstructorUsedError; // Duration in seconds
  int get duration => throw _privateConstructorUsedError; // Duration in seconds
  set duration(int value) => throw _privateConstructorUsedError;
  bool? get pomodoro => throw _privateConstructorUsedError;
  set pomodoro(bool? value) => throw _privateConstructorUsedError;
  bool? get timer => throw _privateConstructorUsedError;
  set timer(bool? value) => throw _privateConstructorUsedError;
  bool? get pomoBreak => throw _privateConstructorUsedError;
  set pomoBreak(bool? value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  /// Serializes this TimeEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeEntryCopyWith<TimeEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeEntryCopyWith<$Res> {
  factory $TimeEntryCopyWith(TimeEntry value, $Res Function(TimeEntry) then) =
      _$TimeEntryCopyWithImpl<$Res, TimeEntry>;
  @useResult
  $Res call(
      {String? id,
      String? taskId,
      DateTime startDate,
      DateTime endDate,
      int duration,
      bool? pomodoro,
      bool? timer,
      bool? pomoBreak,
      String? note,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TimeEntryCopyWithImpl<$Res, $Val extends TimeEntry>
    implements $TimeEntryCopyWith<$Res> {
  _$TimeEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? taskId = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
    Object? pomodoro = freezed,
    Object? timer = freezed,
    Object? pomoBreak = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoro: freezed == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as bool?,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as bool?,
      pomoBreak: freezed == pomoBreak
          ? _value.pomoBreak
          : pomoBreak // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeEntryImplCopyWith<$Res>
    implements $TimeEntryCopyWith<$Res> {
  factory _$$TimeEntryImplCopyWith(
          _$TimeEntryImpl value, $Res Function(_$TimeEntryImpl) then) =
      __$$TimeEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? taskId,
      DateTime startDate,
      DateTime endDate,
      int duration,
      bool? pomodoro,
      bool? timer,
      bool? pomoBreak,
      String? note,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$TimeEntryImplCopyWithImpl<$Res>
    extends _$TimeEntryCopyWithImpl<$Res, _$TimeEntryImpl>
    implements _$$TimeEntryImplCopyWith<$Res> {
  __$$TimeEntryImplCopyWithImpl(
      _$TimeEntryImpl _value, $Res Function(_$TimeEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? taskId = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
    Object? pomodoro = freezed,
    Object? timer = freezed,
    Object? pomoBreak = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TimeEntryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoro: freezed == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as bool?,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as bool?,
      pomoBreak: freezed == pomoBreak
          ? _value.pomoBreak
          : pomoBreak // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeEntryImpl extends _TimeEntry {
  _$TimeEntryImpl(
      {this.id,
      this.taskId,
      required this.startDate,
      required this.endDate,
      required this.duration,
      this.pomodoro,
      this.timer,
      this.pomoBreak,
      this.note,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$TimeEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeEntryImplFromJson(json);

  @override
  String? id;
  @override
  String? taskId;
  @override
  DateTime startDate;
  @override
  DateTime endDate;
// Duration in seconds
  @override
  int duration;
  @override
  bool? pomodoro;
  @override
  bool? timer;
  @override
  bool? pomoBreak;
  @override
  String? note;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeEntryImplCopyWith<_$TimeEntryImpl> get copyWith =>
      __$$TimeEntryImplCopyWithImpl<_$TimeEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeEntryImplToJson(
      this,
    );
  }
}

abstract class _TimeEntry extends TimeEntry {
  factory _TimeEntry(
      {String? id,
      String? taskId,
      required DateTime startDate,
      required DateTime endDate,
      required int duration,
      bool? pomodoro,
      bool? timer,
      bool? pomoBreak,
      String? note,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$TimeEntryImpl;
  _TimeEntry._() : super._();

  factory _TimeEntry.fromJson(Map<String, dynamic> json) =
      _$TimeEntryImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get taskId;
  set taskId(String? value);
  @override
  DateTime get startDate;
  set startDate(DateTime value);
  @override
  DateTime get endDate;
  set endDate(DateTime value); // Duration in seconds
  @override
  int get duration; // Duration in seconds
  set duration(int value);
  @override
  bool? get pomodoro;
  set pomodoro(bool? value);
  @override
  bool? get timer;
  set timer(bool? value);
  @override
  bool? get pomoBreak;
  set pomoBreak(bool? value);
  @override
  String? get note;
  set note(String? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeEntryImplCopyWith<_$TimeEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
