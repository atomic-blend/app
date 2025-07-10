// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyncResult _$SyncResultFromJson(Map<String, dynamic> json) {
  return _SyncResult.fromJson(json);
}

/// @nodoc
mixin _$SyncResult {
  List<String> get success => throw _privateConstructorUsedError;
  List<ConflictedItem> get conflicts => throw _privateConstructorUsedError;
  List<PatchError> get errors => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this SyncResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncResultCopyWith<SyncResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncResultCopyWith<$Res> {
  factory $SyncResultCopyWith(
          SyncResult value, $Res Function(SyncResult) then) =
      _$SyncResultCopyWithImpl<$Res, SyncResult>;
  @useResult
  $Res call(
      {List<String> success,
      List<ConflictedItem> conflicts,
      List<PatchError> errors,
      DateTime date});
}

/// @nodoc
class _$SyncResultCopyWithImpl<$Res, $Val extends SyncResult>
    implements $SyncResultCopyWith<$Res> {
  _$SyncResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? conflicts = null,
    Object? errors = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as List<String>,
      conflicts: null == conflicts
          ? _value.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as List<ConflictedItem>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<PatchError>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncResultImplCopyWith<$Res>
    implements $SyncResultCopyWith<$Res> {
  factory _$$SyncResultImplCopyWith(
          _$SyncResultImpl value, $Res Function(_$SyncResultImpl) then) =
      __$$SyncResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> success,
      List<ConflictedItem> conflicts,
      List<PatchError> errors,
      DateTime date});
}

/// @nodoc
class __$$SyncResultImplCopyWithImpl<$Res>
    extends _$SyncResultCopyWithImpl<$Res, _$SyncResultImpl>
    implements _$$SyncResultImplCopyWith<$Res> {
  __$$SyncResultImplCopyWithImpl(
      _$SyncResultImpl _value, $Res Function(_$SyncResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? conflicts = null,
    Object? errors = null,
    Object? date = null,
  }) {
    return _then(_$SyncResultImpl(
      success: null == success
          ? _value._success
          : success // ignore: cast_nullable_to_non_nullable
              as List<String>,
      conflicts: null == conflicts
          ? _value._conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as List<ConflictedItem>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<PatchError>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncResultImpl implements _SyncResult {
  const _$SyncResultImpl(
      {required final List<String> success,
      required final List<ConflictedItem> conflicts,
      required final List<PatchError> errors,
      required this.date})
      : _success = success,
        _conflicts = conflicts,
        _errors = errors;

  factory _$SyncResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncResultImplFromJson(json);

  final List<String> _success;
  @override
  List<String> get success {
    if (_success is EqualUnmodifiableListView) return _success;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_success);
  }

  final List<ConflictedItem> _conflicts;
  @override
  List<ConflictedItem> get conflicts {
    if (_conflicts is EqualUnmodifiableListView) return _conflicts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conflicts);
  }

  final List<PatchError> _errors;
  @override
  List<PatchError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  final DateTime date;

  @override
  String toString() {
    return 'SyncResult(success: $success, conflicts: $conflicts, errors: $errors, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncResultImpl &&
            const DeepCollectionEquality().equals(other._success, _success) &&
            const DeepCollectionEquality()
                .equals(other._conflicts, _conflicts) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_success),
      const DeepCollectionEquality().hash(_conflicts),
      const DeepCollectionEquality().hash(_errors),
      date);

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncResultImplCopyWith<_$SyncResultImpl> get copyWith =>
      __$$SyncResultImplCopyWithImpl<_$SyncResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncResultImplToJson(
      this,
    );
  }
}

abstract class _SyncResult implements SyncResult {
  const factory _SyncResult(
      {required final List<String> success,
      required final List<ConflictedItem> conflicts,
      required final List<PatchError> errors,
      required final DateTime date}) = _$SyncResultImpl;

  factory _SyncResult.fromJson(Map<String, dynamic> json) =
      _$SyncResultImpl.fromJson;

  @override
  List<String> get success;
  @override
  List<ConflictedItem> get conflicts;
  @override
  List<PatchError> get errors;
  @override
  DateTime get date;

  /// Create a copy of SyncResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncResultImplCopyWith<_$SyncResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
