// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get firebase_id => throw _privateConstructorUsedError;
  set firebase_id(String? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  List<dynamic> get roles => throw _privateConstructorUsedError;
  set roles(List<dynamic> value) => throw _privateConstructorUsedError;
  List<dynamic>? get purchases => throw _privateConstructorUsedError;
  set purchases(List<dynamic>? value) => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  set firstname(String? value) => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  set lastname(String? value) => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  set refreshToken(String? value) => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  set idToken(String? value) => throw _privateConstructorUsedError;

  /// Serializes this UserEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String? id,
      String? firebase_id,
      String? email,
      List<dynamic> roles,
      List<dynamic>? purchases,
      String? firstname,
      String? lastname,
      String? refreshToken,
      String? idToken});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firebase_id = freezed,
    Object? email = freezed,
    Object? roles = null,
    Object? purchases = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? refreshToken = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firebase_id: freezed == firebase_id
          ? _value.firebase_id
          : firebase_id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      purchases: freezed == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firebase_id,
      String? email,
      List<dynamic> roles,
      List<dynamic>? purchases,
      String? firstname,
      String? lastname,
      String? refreshToken,
      String? idToken});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firebase_id = freezed,
    Object? email = freezed,
    Object? roles = null,
    Object? purchases = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? refreshToken = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$UserEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firebase_id: freezed == firebase_id
          ? _value.firebase_id
          : firebase_id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      purchases: freezed == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl extends _UserEntity {
  _$UserEntityImpl(
      {this.id,
      this.firebase_id,
      required this.email,
      required this.roles,
      this.purchases,
      this.firstname,
      this.lastname,
      this.refreshToken,
      this.idToken})
      : super._();

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  String? id;
  @override
  String? firebase_id;
  @override
  String? email;
  @override
  List<dynamic> roles;
  @override
  List<dynamic>? purchases;
  @override
  String? firstname;
  @override
  String? lastname;
  @override
  String? refreshToken;
  @override
  String? idToken;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity extends UserEntity {
  factory _UserEntity(
      {String? id,
      String? firebase_id,
      required String? email,
      required List<dynamic> roles,
      List<dynamic>? purchases,
      String? firstname,
      String? lastname,
      String? refreshToken,
      String? idToken}) = _$UserEntityImpl;
  _UserEntity._() : super._();

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get firebase_id;
  set firebase_id(String? value);
  @override
  String? get email;
  set email(String? value);
  @override
  List<dynamic> get roles;
  set roles(List<dynamic> value);
  @override
  List<dynamic>? get purchases;
  set purchases(List<dynamic>? value);
  @override
  String? get firstname;
  set firstname(String? value);
  @override
  String? get lastname;
  set lastname(String? value);
  @override
  String? get refreshToken;
  set refreshToken(String? value);
  @override
  String? get idToken;
  set idToken(String? value);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
