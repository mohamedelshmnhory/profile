import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

Future<String?> getUUID() async {
  var deviceInfo = DeviceInfoPlugin();
  try {
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor ??
          iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.fingerprint; // unique ID on Android
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}
