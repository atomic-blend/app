import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceInfoService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<Map<String, String>> getDeviceInfo() async {
    // Get the device FCM token
    String? token = await _messaging.getToken();

    // Get the device name or model
    String deviceName = 'Unknown';
    String deviceId = 'Unknown';

    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      deviceName = '${info.manufacturer} ${info.model}';
      deviceId = info.id;
    } else if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      deviceName = '${info.name} ${info.model}';
      deviceId = info.identifierForVendor ?? info.name;
    }

    return {
      'fcm_token': token ?? '',
      'device_name': deviceName,
      'device_id': deviceId,
    };
  }
}