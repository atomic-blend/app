// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encryption_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EncryptionKeyEntityImpl _$$EncryptionKeyEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EncryptionKeyEntityImpl(
      userKey: json['userKey'] as String,
      backupKey: json['backupKey'] as String,
      salt: json['salt'] as String,
      mnemonicSalt: json['mnemonicSalt'] as String,
      backupPhrase: json['backupPhrase'] as String?,
    );

Map<String, dynamic> _$$EncryptionKeyEntityImplToJson(
        _$EncryptionKeyEntityImpl instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'backupKey': instance.backupKey,
      'salt': instance.salt,
      'mnemonicSalt': instance.mnemonicSalt,
    };
