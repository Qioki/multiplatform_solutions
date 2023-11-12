import 'dart:io';
import 'package:flutter/foundation.dart';

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'ios': CustomPlatform.ios,
    'fuchsia': CustomPlatform.fuchsia,
  };
  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }
    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static bool get isMobile => Platform.isAndroid || Platform.isIOS;

  static CustomPlatform get platform => _getPlatform();
}

enum CustomPlatform {
  web,
  linux,
  macos,
  windows,
  ios,
  fuchsia,
  undefined,
}
