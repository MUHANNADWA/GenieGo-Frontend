import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class AppLocaleController extends GetxController {
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
    Locale locale = Locale(langCode);
    localStorage.write('lang', langCode);
    Get.updateLocale(locale);
  }
}
