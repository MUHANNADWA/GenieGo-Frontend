import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();
  final localStorage = GetStorage();

  Locale initialTheme() {
    return localStorage.read('theme') == null
        ? Get.deviceLocale!
        : Locale(localStorage.read('theme'));
  }

  void toggleTheme() {
    // AppHelper.currentTheme == 'ar' ? changeTheme('en') : changeTheme('ar');
  }

  void changeTheme(String themeName) {
    themeName = themeName.toLowerCase();
    if (themeName == 'system') {
      Get.updateLocale(Get.deviceLocale!);
      localStorage.write('theme', Get.deviceLocale!.toString());
    } else {
      Locale locale = Locale(themeName);
      localStorage.write('theme', themeName);
      Get.updateLocale(locale);
    }
  }
}
