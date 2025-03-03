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
      idToken: json['idToken'] as String?,
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
      'idToken': instance.idToken,
    };
