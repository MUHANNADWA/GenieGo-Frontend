import 'package:flutter/material.dart';
import 'package:geniego/utils/locale/locale_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final localStorage = GetStorage();

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  //* Settings Variables
  Rx<String> languages = 'System'.obs;
  Rx<String> themes = 'System'.obs;
  Rx<bool> geoLocation = true.obs;
  Rx<bool> notification = true.obs;

  @override
  void onReady() {
    geoLocation.value = localStorage.read('geoLocation') ?? true;
    notification.value = localStorage.read('notification') ?? true;
    languages.value = localStorage.read('lang') ?? 'System';
    themes.value = localStorage.read('theme') ?? 'System';
    super.onReady();
  }

  void chnageLang(lang) {
    // lang = lang.toString();

    AppLocaleController.instance.changeLang(lang);

    languages.value = lang;
  }

  void chnageTheme(theme) {
    // theme = theme.toString();

    theme == 'Dark'
        ? Get.changeThemeMode(ThemeMode.dark)
        : theme == 'System'
            ? Get.changeThemeMode(ThemeMode.system)
            : Get.changeThemeMode(ThemeMode.light);

    themes.value = theme;
  }

  void toggleGeolocation(value) {
    localStorage.write('geoLocation', value);
    geoLocation.value = !geoLocation.value;
  }

  void toggleNotification(value) {
    localStorage.write('notification', value);
    notification.value = !notification.value;
  }
}
