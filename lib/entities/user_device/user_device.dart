import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device.freezed.dart';
part 'user_device.g.dart';

@unfreezed
class UserDeviceEntity with _$UserDeviceEntity {
  const UserDeviceEntity._();
  factory UserDeviceEntity({
    required String fcmToken,
    required String deviceName,
    required String deviceId,
    String? deviceTimezone,
  }) = _UserDeviceEntity;

  @override
  String toString() {
    return 'UserDeviceEntity { fcm_token: $fcmToken, device_name: $deviceName, device_id: $deviceId, device_timezone: $deviceTimezone }';
  }

  factory UserDeviceEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceEntityFromJson(json);
}
