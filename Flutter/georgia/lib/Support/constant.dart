import 'package:platform/platform.dart';

import 'package:flutter/material.dart';

class Const {
  static double _hDevice = 0;
  static double _wDevice = 0;
  static Platform _platform = const Platform();
  static double _statusBarHeight = 0;

  static setSize(BuildContext cont) {
    final size = MediaQuery.of(cont).size;

    _hDevice = size.height;
    _wDevice = size.width;

    statusBarHeight = MediaQuery.of(cont).padding.top;
  }

  static bool get itIOS {
    return Platform().isAndroid;
  }

  static bool get itAndroid {
    return Platform.isAndroid;
  }

  static double get heightDewice {
    return Const._hDevice;
  }

  static double get widthDewice {
    return Const._wDevice;
  }

  //методы для иос

  static bool get isIPhoneXorXmax {
    return _hDevice >= 812;
  }

  static int get navigBarHeight {
    return 44;
  }

  static int get heightTabBar {
    return isIPhoneXorXmax ? 84 : 58;
  }
}
