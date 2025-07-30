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
      publicKey: json['publicKey'] as String?,
      type: json['type'] as String?,
      backupPhrase: json['backupPhrase'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EncryptionKeyEntityImplToJson(
        _$EncryptionKeyEntityImpl instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'backupKey': instance.backupKey,
      'salt': instance.salt,
      'mnemonicSalt': instance.mnemonicSalt,
      'publicKey': instance.publicKey,
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
