// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String?,
      firebase_id: json['firebase_id'] as String?,
      email: json['email'] as String?,
      roles: json['roles'] as List<dynamic>,
      purchases: json['purchases'] as List<dynamic>?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      refreshToken: json['refreshToken'] as String?,
      keySalt: json['keySalt'] as String,
      accessToken: json['accessToken'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firebase_id': instance.firebase_id,
      'email': instance.email,
      'roles': instance.roles,
      'purchases': instance.purchases,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'refreshToken': instance.refreshToken,
      'keySalt': instance.keySalt,
      'accessToken': instance.accessToken,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
