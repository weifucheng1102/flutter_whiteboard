import 'dart:async';
import 'dart:ffi';

import 'package:flutter/services.dart';

class FlutterWhiteboard {
  static const MethodChannel _channel =
      const MethodChannel('flutter_whiteboard');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static pushView() async {
    await _channel.invokeListMethod('push');
  }
}
