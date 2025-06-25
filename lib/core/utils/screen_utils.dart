import 'package:flutter/material.dart';

enum DeviceScreenType { mobile, tablet, desktop }

class ScreenUtils {
  static DeviceScreenType getDeviceType(BoxConstraints constraints) {
    if (constraints.maxWidth >= 1200) {
      return DeviceScreenType.desktop;
    } else if (constraints.maxWidth >= 600) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.mobile;
    }
  }
}
