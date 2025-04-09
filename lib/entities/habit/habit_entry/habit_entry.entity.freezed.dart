// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_entry.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitEntry _$HabitEntryFromJson(Map<String, dynamic> json) {
  return _HabitEntry.fromJson(json);
}

/// @nodoc
mixin _$HabitEntry {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String get habitId => throw _privateConstructorUsedError;
  set habitId(String value) => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  set userId(String? value) => throw _privateConstructorUsedError;
  DateTime get entryDate => throw _privateConstructorUsedError;
  set entryDate(DateTime value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  /// Serializes this HabitEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitEntryCopyWith<HabitEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitEntryCopyWith<$Res> {
  factory $HabitEntryCopyWith(
          HabitEntry value, $Res Function(HabitEntry) then) =
      _$HabitEntryCopyWithImpl<$Res, HabitEntry>;
  @useResult
  $Res call(
      {String? id,
      String habitId,
      String? userId,
      DateTime entryDate,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$HabitEntryCopyWithImpl<$Res, $Val extends HabitEntry>
    implements $HabitEntryCopyWith<$Res> {
  _$HabitEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? habitId = null,
    Object? userId = freezed,
    Object? entryDate = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: null == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$HabitEntryImplCopyWith<$Res>
    implements $HabitEntryCopyWith<$Res> {
  factory _$$HabitEntryImplCopyWith(
          _$HabitEntryImpl value, $Res Function(_$HabitEntryImpl) then) =
      __$$HabitEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String habitId,
      String? userId,
      DateTime entryDate,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$HabitEntryImplCopyWithImpl<$Res>
    extends _$HabitEntryCopyWithImpl<$Res, _$HabitEntryImpl>
    implements _$$HabitEntryImplCopyWith<$Res> {
  __$$HabitEntryImplCopyWithImpl(
      _$HabitEntryImpl _value, $Res Function(_$HabitEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? habitId = null,
    Object? userId = freezed,
    Object? entryDate = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$HabitEntryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: null == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$HabitEntryImpl implements _HabitEntry {
  _$HabitEntryImpl(
      {this.id,
      required this.habitId,
      this.userId,
      required this.entryDate,
      this.createdAt,
      this.updatedAt});

  factory _$HabitEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitEntryImplFromJson(json);

  @override
  String? id;
  @override
  String habitId;
  @override
  String? userId;
  @override
  DateTime entryDate;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  @override
  String toString() {
    return 'HabitEntry(id: $id, habitId: $habitId, userId: $userId, entryDate: $entryDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      __$$HabitEntryImplCopyWithImpl<_$HabitEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitEntryImplToJson(
      this,
    );
  }
}

abstract class _HabitEntry implements HabitEntry {
  factory _HabitEntry(
      {String? id,
      required String habitId,
      String? userId,
      required DateTime entryDate,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$HabitEntryImpl;

  factory _HabitEntry.fromJson(Map<String, dynamic> json) =
      _$HabitEntryImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String get habitId;
  set habitId(String value);
  @override
  String? get userId;
  set userId(String? value);
  @override
  DateTime get entryDate;
  set entryDate(DateTime value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
