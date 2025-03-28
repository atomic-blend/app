// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDeviceEntity _$UserDeviceEntityFromJson(Map<String, dynamic> json) {
  return _UserDeviceEntity.fromJson(json);
}

/// @nodoc
mixin _$UserDeviceEntity {
  String get fcmToken => throw _privateConstructorUsedError;
  set fcmToken(String value) => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  set deviceName(String value) => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  set deviceId(String value) => throw _privateConstructorUsedError;
  String? get deviceTimezone => throw _privateConstructorUsedError;
  set deviceTimezone(String? value) => throw _privateConstructorUsedError;

  /// Serializes this UserDeviceEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDeviceEntityCopyWith<UserDeviceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceEntityCopyWith<$Res> {
  factory $UserDeviceEntityCopyWith(
          UserDeviceEntity value, $Res Function(UserDeviceEntity) then) =
      _$UserDeviceEntityCopyWithImpl<$Res, UserDeviceEntity>;
  @useResult
  $Res call(
      {String fcmToken,
      String deviceName,
      String deviceId,
      String? deviceTimezone});
}

/// @nodoc
class _$UserDeviceEntityCopyWithImpl<$Res, $Val extends UserDeviceEntity>
    implements $UserDeviceEntityCopyWith<$Res> {
  _$UserDeviceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
    Object? deviceName = null,
    Object? deviceId = null,
    Object? deviceTimezone = freezed,
  }) {
    return _then(_value.copyWith(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceTimezone: freezed == deviceTimezone
          ? _value.deviceTimezone
          : deviceTimezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceEntityImplCopyWith<$Res>
    implements $UserDeviceEntityCopyWith<$Res> {
  factory _$$UserDeviceEntityImplCopyWith(_$UserDeviceEntityImpl value,
          $Res Function(_$UserDeviceEntityImpl) then) =
      __$$UserDeviceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fcmToken,
      String deviceName,
      String deviceId,
      String? deviceTimezone});
}

/// @nodoc
class __$$UserDeviceEntityImplCopyWithImpl<$Res>
    extends _$UserDeviceEntityCopyWithImpl<$Res, _$UserDeviceEntityImpl>
    implements _$$UserDeviceEntityImplCopyWith<$Res> {
  __$$UserDeviceEntityImplCopyWithImpl(_$UserDeviceEntityImpl _value,
      $Res Function(_$UserDeviceEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
    Object? deviceName = null,
    Object? deviceId = null,
    Object? deviceTimezone = freezed,
  }) {
    return _then(_$UserDeviceEntityImpl(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceTimezone: freezed == deviceTimezone
          ? _value.deviceTimezone
          : deviceTimezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceEntityImpl extends _UserDeviceEntity {
  _$UserDeviceEntityImpl(
      {required this.fcmToken,
      required this.deviceName,
      required this.deviceId,
      this.deviceTimezone})
      : super._();

  factory _$UserDeviceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceEntityImplFromJson(json);

  @override
  String fcmToken;
  @override
  String deviceName;
  @override
  String deviceId;
  @override
  String? deviceTimezone;

  /// Create a copy of UserDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceEntityImplCopyWith<_$UserDeviceEntityImpl> get copyWith =>
      __$$UserDeviceEntityImplCopyWithImpl<_$UserDeviceEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceEntityImplToJson(
      this,
    );
  }
}

abstract class _UserDeviceEntity extends UserDeviceEntity {
  factory _UserDeviceEntity(
      {required String fcmToken,
      required String deviceName,
      required String deviceId,
      String? deviceTimezone}) = _$UserDeviceEntityImpl;
  _UserDeviceEntity._() : super._();

  factory _UserDeviceEntity.fromJson(Map<String, dynamic> json) =
      _$UserDeviceEntityImpl.fromJson;

  @override
  String get fcmToken;
  set fcmToken(String value);
  @override
  String get deviceName;
  set deviceName(String value);
  @override
  String get deviceId;
  set deviceId(String value);
  @override
  String? get deviceTimezone;
  set deviceTimezone(String? value);

  /// Create a copy of UserDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDeviceEntityImplCopyWith<_$UserDeviceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
