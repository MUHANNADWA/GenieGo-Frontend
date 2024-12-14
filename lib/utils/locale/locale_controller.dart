import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class AppLocaleController extends GetxController {
  static AppLocaleController get instance => Get.find();
  final localStorage = GetStorage();

  Locale initialLang() {
    return localStorage.read('lang') == null
        ? Get.deviceLocale!
        : Locale(localStorage.read('lang'));
  }

  void toggleLang() {
    AppHelper.currentLang == 'ar' ? changeLang('en') : changeLang('ar');
  }

  void changeLang(String langCode) {
    if (langCode == 'System') {
      Get.updateLocale(Get.deviceLocale!);
      localStorage.write('lang', Get.deviceLocale!.toString());
    } else {
      langCode = langCode.toLowerCase();
      Locale locale = Locale(langCode);
      localStorage.write('lang', langCode);
      Get.updateLocale(locale);
    }
  }
}
