import 'package:app/entities/user_device/user_device.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

import 'package:flutter_timezone/flutter_timezone.dart';

class DeviceInfoService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<UserDeviceEntity> getDeviceInfo() async {
    // Get the device FCM token
    String? token = await _messaging.getToken();

    // Get the device name or model
    String deviceName = 'Unknown';
    String deviceId = 'Unknown';
    String deviceTimezone = 'Unknown';

    final timezone = await FlutterTimezone.getLocalTimezone();

    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      deviceName = '${info.manufacturer} - ${info.version.codename}';
      deviceId = info.id;
      deviceTimezone = timezone;
    } else if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      deviceName = '${info.name} - ${info.systemName}';
      deviceId = info.identifierForVendor ?? info.name;
      deviceTimezone = timezone;
    }

    return UserDeviceEntity(
        fcmToken: token!, deviceName: deviceName, deviceId: deviceId, deviceTimezone: deviceTimezone);
  }
}
