import 'package:flutter/material.dart';
import 'package:geniego/utils/locale/locale_controller.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  //* Settings Variables
  Rx<bool> geoLocation = true.obs;
  Rx<bool> notification = true.obs;
  Rx<String> languages = 'System'.obs;
  Rx<String> themes = 'System'.obs;

  void chnageLang(lang) {
    lang = lang.toString();

    AppLocaleController.instance.changeLang(lang);

    languages.value = lang;
  }

  void chnageTheme(theme) {
    theme = theme.toString();

    theme == 'Dark'
        ? Get.changeThemeMode(ThemeMode.dark)
        : theme == 'System'
            ? Get.changeThemeMode(ThemeMode.system)
            : Get.changeThemeMode(ThemeMode.light);

    themes.value = theme;
  }
}
