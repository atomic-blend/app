// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patch_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchChange _$PatchChangeFromJson(Map<String, dynamic> json) {
  return _PatchChange.fromJson(json);
}

/// @nodoc
mixin _$PatchChange {
  String get key => throw _privateConstructorUsedError;
  set key(String value) => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  set value(dynamic value) => throw _privateConstructorUsedError;

  /// Serializes this PatchChange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchChangeCopyWith<PatchChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchChangeCopyWith<$Res> {
  factory $PatchChangeCopyWith(
          PatchChange value, $Res Function(PatchChange) then) =
      _$PatchChangeCopyWithImpl<$Res, PatchChange>;
  @useResult
  $Res call({String key, dynamic value});
}

/// @nodoc
class _$PatchChangeCopyWithImpl<$Res, $Val extends PatchChange>
    implements $PatchChangeCopyWith<$Res> {
  _$PatchChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchChangeImplCopyWith<$Res>
    implements $PatchChangeCopyWith<$Res> {
  factory _$$PatchChangeImplCopyWith(
          _$PatchChangeImpl value, $Res Function(_$PatchChangeImpl) then) =
      __$$PatchChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, dynamic value});
}

/// @nodoc
class __$$PatchChangeImplCopyWithImpl<$Res>
    extends _$PatchChangeCopyWithImpl<$Res, _$PatchChangeImpl>
    implements _$$PatchChangeImplCopyWith<$Res> {
  __$$PatchChangeImplCopyWithImpl(
      _$PatchChangeImpl _value, $Res Function(_$PatchChangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_$PatchChangeImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchChangeImpl implements _PatchChange {
  _$PatchChangeImpl({required this.key, required this.value});

  factory _$PatchChangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchChangeImplFromJson(json);

  @override
  String key;
  @override
  dynamic value;

  @override
  String toString() {
    return 'PatchChange(key: $key, value: $value)';
  }

  /// Create a copy of PatchChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchChangeImplCopyWith<_$PatchChangeImpl> get copyWith =>
      __$$PatchChangeImplCopyWithImpl<_$PatchChangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchChangeImplToJson(
      this,
    );
  }
}

abstract class _PatchChange implements PatchChange {
  factory _PatchChange({required String key, required dynamic value}) =
      _$PatchChangeImpl;

  factory _PatchChange.fromJson(Map<String, dynamic> json) =
      _$PatchChangeImpl.fromJson;

  @override
  String get key;
  set key(String value);
  @override
  dynamic get value;
  set value(dynamic value);

  /// Create a copy of PatchChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchChangeImplCopyWith<_$PatchChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
