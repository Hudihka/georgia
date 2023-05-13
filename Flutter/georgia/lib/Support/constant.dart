import 'dart:io' as IO;
import 'package:flutter/material.dart';

class Const {
  static double _hDevice = 0;
  static double _wDevice = 0;
  static double _statusBarHeight = 0;
  static double _navBarHeight = 0;

  static setSize(BuildContext cont) {
    final size = MediaQuery.of(cont).size;

    _hDevice = size.height;
    _wDevice = size.width;

    _statusBarHeight = MediaQuery.of(cont).padding.top;
    _navBarHeight = AppBar().preferredSize.height;
  }

  static bool get itIOS {
    return IO.Platform.isIOS;
  }

  static bool get itAndroid {
    return IO.Platform.isAndroid;
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

  static int get heightAllNavBar {
    return 44;
  }

  static int get heightTabBar {
    return isIPhoneXorXmax ? 84 : 58;
  }

  // методы сразу для 2х систем

  static double get fullHeightNB {
    return AppBar().preferredSize.height + _statusBarHeight; //88 : 64
  }

  static double get fullHeightBody {
    return _hDevice - Const.fullHeightNB;
  }
}
