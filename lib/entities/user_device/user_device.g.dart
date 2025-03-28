// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDeviceEntityImpl _$$UserDeviceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDeviceEntityImpl(
      fcmToken: json['fcmToken'] as String,
      deviceName: json['deviceName'] as String,
      deviceId: json['deviceId'] as String,
      deviceTimezone: json['deviceTimezone'] as String?,
    );

Map<String, dynamic> _$$UserDeviceEntityImplToJson(
        _$UserDeviceEntityImpl instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'deviceName': instance.deviceName,
      'deviceId': instance.deviceId,
      'deviceTimezone': instance.deviceTimezone,
    };
