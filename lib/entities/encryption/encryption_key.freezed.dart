// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encryption_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EncryptionKeyEntity _$EncryptionKeyEntityFromJson(Map<String, dynamic> json) {
  return _EncryptionKeyEntity.fromJson(json);
}

/// @nodoc
mixin _$EncryptionKeyEntity {
// the encryption key encrypted with pwd derived key
  String get userKey =>
      throw _privateConstructorUsedError; // the encryption key encrypted with pwd derived key
  set userKey(String value) =>
      throw _privateConstructorUsedError; // the encryption key encrypted with backup key
  String get backupKey =>
      throw _privateConstructorUsedError; // the encryption key encrypted with backup key
  set backupKey(String value) =>
      throw _privateConstructorUsedError; // the salt used to derive the encryption key
  String get salt =>
      throw _privateConstructorUsedError; // the salt used to derive the encryption key
  set salt(String value) =>
      throw _privateConstructorUsedError; // the salt used to derive the mnemonic
  String get mnemonicSalt =>
      throw _privateConstructorUsedError; // the salt used to derive the mnemonic
  set mnemonicSalt(String value) =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  String? get backupPhrase =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  set backupPhrase(String? value) => throw _privateConstructorUsedError;

  /// Serializes this EncryptionKeyEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EncryptionKeyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EncryptionKeyEntityCopyWith<EncryptionKeyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EncryptionKeyEntityCopyWith<$Res> {
  factory $EncryptionKeyEntityCopyWith(
          EncryptionKeyEntity value, $Res Function(EncryptionKeyEntity) then) =
      _$EncryptionKeyEntityCopyWithImpl<$Res, EncryptionKeyEntity>;
  @useResult
  $Res call(
      {String userKey,
      String backupKey,
      String salt,
      String mnemonicSalt,
      @JsonKey(includeToJson: false) String? backupPhrase});
}

/// @nodoc
class _$EncryptionKeyEntityCopyWithImpl<$Res, $Val extends EncryptionKeyEntity>
    implements $EncryptionKeyEntityCopyWith<$Res> {
  _$EncryptionKeyEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EncryptionKeyEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userKey = null,
    Object? backupKey = null,
    Object? salt = null,
    Object? mnemonicSalt = null,
    Object? backupPhrase = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: null == userKey
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      backupKey: null == backupKey
          ? _value.backupKey
          : backupKey // ignore: cast_nullable_to_non_nullable
              as String,
      salt: null == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonicSalt: null == mnemonicSalt
          ? _value.mnemonicSalt
          : mnemonicSalt // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhrase: freezed == backupPhrase
          ? _value.backupPhrase
          : backupPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EncryptionKeyEntityImplCopyWith<$Res>
    implements $EncryptionKeyEntityCopyWith<$Res> {
  factory _$$EncryptionKeyEntityImplCopyWith(_$EncryptionKeyEntityImpl value,
          $Res Function(_$EncryptionKeyEntityImpl) then) =
      __$$EncryptionKeyEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userKey,
      String backupKey,
      String salt,
      String mnemonicSalt,
      @JsonKey(includeToJson: false) String? backupPhrase});
}

/// @nodoc
class __$$EncryptionKeyEntityImplCopyWithImpl<$Res>
    extends _$EncryptionKeyEntityCopyWithImpl<$Res, _$EncryptionKeyEntityImpl>
    implements _$$EncryptionKeyEntityImplCopyWith<$Res> {
  __$$EncryptionKeyEntityImplCopyWithImpl(_$EncryptionKeyEntityImpl _value,
      $Res Function(_$EncryptionKeyEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncryptionKeyEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userKey = null,
    Object? backupKey = null,
    Object? salt = null,
    Object? mnemonicSalt = null,
    Object? backupPhrase = freezed,
  }) {
    return _then(_$EncryptionKeyEntityImpl(
      userKey: null == userKey
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      backupKey: null == backupKey
          ? _value.backupKey
          : backupKey // ignore: cast_nullable_to_non_nullable
              as String,
      salt: null == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonicSalt: null == mnemonicSalt
          ? _value.mnemonicSalt
          : mnemonicSalt // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhrase: freezed == backupPhrase
          ? _value.backupPhrase
          : backupPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EncryptionKeyEntityImpl extends _EncryptionKeyEntity {
  _$EncryptionKeyEntityImpl(
      {required this.userKey,
      required this.backupKey,
      required this.salt,
      required this.mnemonicSalt,
      @JsonKey(includeToJson: false) this.backupPhrase})
      : super._();

  factory _$EncryptionKeyEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EncryptionKeyEntityImplFromJson(json);

// the encryption key encrypted with pwd derived key
  @override
  String userKey;
// the encryption key encrypted with backup key
  @override
  String backupKey;
// the salt used to derive the encryption key
  @override
  String salt;
// the salt used to derive the mnemonic
  @override
  String mnemonicSalt;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String? backupPhrase;

  /// Create a copy of EncryptionKeyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EncryptionKeyEntityImplCopyWith<_$EncryptionKeyEntityImpl> get copyWith =>
      __$$EncryptionKeyEntityImplCopyWithImpl<_$EncryptionKeyEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EncryptionKeyEntityImplToJson(
      this,
    );
  }
}

abstract class _EncryptionKeyEntity extends EncryptionKeyEntity {
  factory _EncryptionKeyEntity(
          {required String userKey,
          required String backupKey,
          required String salt,
          required String mnemonicSalt,
          @JsonKey(includeToJson: false) String? backupPhrase}) =
      _$EncryptionKeyEntityImpl;
  _EncryptionKeyEntity._() : super._();

  factory _EncryptionKeyEntity.fromJson(Map<String, dynamic> json) =
      _$EncryptionKeyEntityImpl.fromJson;

// the encryption key encrypted with pwd derived key
  @override
  String get userKey; // the encryption key encrypted with pwd derived key
  set userKey(String value); // the encryption key encrypted with backup key
  @override
  String get backupKey; // the encryption key encrypted with backup key
  set backupKey(String value); // the salt used to derive the encryption key
  @override
  String get salt; // the salt used to derive the encryption key
  set salt(String value); // the salt used to derive the mnemonic
  @override
  String get mnemonicSalt; // the salt used to derive the mnemonic
  set mnemonicSalt(String value); // ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String? get backupPhrase; // ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  set backupPhrase(String? value);

  /// Create a copy of EncryptionKeyEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EncryptionKeyEntityImplCopyWith<_$EncryptionKeyEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
