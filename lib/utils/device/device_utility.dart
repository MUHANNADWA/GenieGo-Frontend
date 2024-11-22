import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppDeviceUtils {
  static void hideKeyboard() {
    Get.focusScope?.unfocus();
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation() {
    return Get.context?.mediaQuery.orientation == Orientation.landscape;
  }

  static bool isPortraitOrientation() {
    return Get.context?.mediaQuery.orientation == Orientation.portrait;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }

  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static bool get isIOS => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;

  static double get screenHeight => Get.height;
  static double get screenWidth => Get.width;

  static double get pixelRatio =>
      Get.context?.mediaQuery.devicePixelRatio ?? 1.0;

  static double get statusBarHeight => Get.context?.mediaQueryPadding.top ?? 0;

  static double get bottomNavigationBarHeight => kBottomNavigationBarHeight;

  static double get appBarHeight => kToolbarHeight;

  static double get keyboardHeight =>
      Get.context?.mediaQueryViewInsets.bottom ?? 0;

  static bool get isKeyboardVisible => keyboardHeight > 0;

  static bool get isPhysicalDevice =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}
