import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemeController extends GetxController {
  static AppThemeController get instance => Get.find();
  final localStorage = GetStorage();

  late String? storedTheme;

  ThemeMode get initialTheme => storedTheme == 'Light' || storedTheme == 'فاتح'
      ? ThemeMode.light
      : storedTheme == 'Dark' || storedTheme == 'داكن'
          ? ThemeMode.dark
          : ThemeMode.system;

  @override
  void onInit() {
    super.onInit();
    storedTheme = GetStorage().read('theme');
    _applyInitialTheme();
  }

  void _applyInitialTheme() {
    Get.changeThemeMode(initialTheme);
  }

  void toggleTheme() {
    AppHelper.currentTheme == AppTexts.dark
        ? changeTheme(AppTexts.light)
        : changeTheme(AppTexts.dark);
  }

  void changeTheme(String theme) async {
    theme == AppTexts.system
        ? Get.changeThemeMode(ThemeMode.system)
        : theme == AppTexts.dark
            ? Get.changeThemeMode(ThemeMode.dark)
            : Get.changeThemeMode(ThemeMode.light);

    await localStorage.write('theme', theme);

    update();
  }
}
