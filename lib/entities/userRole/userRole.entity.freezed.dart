// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userRole.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRoleEntity _$UserRoleEntityFromJson(Map<String, dynamic> json) {
  return _UserRoleEntity.fromJson(json);
}

/// @nodoc
mixin _$UserRoleEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get creation_date => throw _privateConstructorUsedError;
  DateTime get last_updated => throw _privateConstructorUsedError;

  /// Serializes this UserRoleEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoleEntityCopyWith<UserRoleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleEntityCopyWith<$Res> {
  factory $UserRoleEntityCopyWith(
          UserRoleEntity value, $Res Function(UserRoleEntity) then) =
      _$UserRoleEntityCopyWithImpl<$Res, UserRoleEntity>;
  @useResult
  $Res call(
      {String id, String name, DateTime creation_date, DateTime last_updated});
}

/// @nodoc
class _$UserRoleEntityCopyWithImpl<$Res, $Val extends UserRoleEntity>
    implements $UserRoleEntityCopyWith<$Res> {
  _$UserRoleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? creation_date = null,
    Object? last_updated = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creation_date: null == creation_date
          ? _value.creation_date
          : creation_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      last_updated: null == last_updated
          ? _value.last_updated
          : last_updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoleEntityImplCopyWith<$Res>
    implements $UserRoleEntityCopyWith<$Res> {
  factory _$$UserRoleEntityImplCopyWith(_$UserRoleEntityImpl value,
          $Res Function(_$UserRoleEntityImpl) then) =
      __$$UserRoleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, DateTime creation_date, DateTime last_updated});
}

/// @nodoc
class __$$UserRoleEntityImplCopyWithImpl<$Res>
    extends _$UserRoleEntityCopyWithImpl<$Res, _$UserRoleEntityImpl>
    implements _$$UserRoleEntityImplCopyWith<$Res> {
  __$$UserRoleEntityImplCopyWithImpl(
      _$UserRoleEntityImpl _value, $Res Function(_$UserRoleEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? creation_date = null,
    Object? last_updated = null,
  }) {
    return _then(_$UserRoleEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creation_date: null == creation_date
          ? _value.creation_date
          : creation_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      last_updated: null == last_updated
          ? _value.last_updated
          : last_updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoleEntityImpl implements _UserRoleEntity {
  _$UserRoleEntityImpl(
      {required this.id,
      required this.name,
      required this.creation_date,
      required this.last_updated});

  factory _$UserRoleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoleEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime creation_date;
  @override
  final DateTime last_updated;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creation_date, creation_date) ||
                other.creation_date == creation_date) &&
            (identical(other.last_updated, last_updated) ||
                other.last_updated == last_updated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, creation_date, last_updated);

  /// Create a copy of UserRoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleEntityImplCopyWith<_$UserRoleEntityImpl> get copyWith =>
      __$$UserRoleEntityImplCopyWithImpl<_$UserRoleEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoleEntityImplToJson(
      this,
    );
  }
}

abstract class _UserRoleEntity implements UserRoleEntity {
  factory _UserRoleEntity(
      {required final String id,
      required final String name,
      required final DateTime creation_date,
      required final DateTime last_updated}) = _$UserRoleEntityImpl;

  factory _UserRoleEntity.fromJson(Map<String, dynamic> json) =
      _$UserRoleEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get creation_date;
  @override
  DateTime get last_updated;

  /// Create a copy of UserRoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoleEntityImplCopyWith<_$UserRoleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
