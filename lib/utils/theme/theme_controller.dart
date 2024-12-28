import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemeController extends GetxController {
  static AppThemeController get instance => Get.find();
  final localStorage = GetStorage();

  final storedTheme = GetStorage().read('theme');

  ThemeMode get initialTheme =>
      storedTheme == null || storedTheme == AppTexts.system
          ? ThemeMode.system
          : storedTheme == AppTexts.dark
              ? ThemeMode.dark
              : ThemeMode.light;

  void toggleTheme() {
    AppHelper.currentTheme == AppTexts.dark
        ? changeTheme(AppTexts.light)
        : changeTheme(AppTexts.dark);
  }

  void changeTheme(String theme) {
    theme == AppTexts.system
        ? Get.changeThemeMode(ThemeMode.system)
        : theme == AppTexts.dark
            ? Get.changeThemeMode(ThemeMode.dark)
            : Get.changeThemeMode(ThemeMode.light);

    localStorage.write('theme', theme);
  }
}
