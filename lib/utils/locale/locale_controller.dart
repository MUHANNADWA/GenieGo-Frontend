import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class AppLocaleController extends GetxController {
  final storage = GetStorage();

  Locale initialLang() {
    return storage.read('lang') == null
        ? Get.deviceLocale!
        : Locale(storage.read('lang'));
  }

  void toggleLang() {
    AppHelper.currentLang == 'ar' ? changeLang('en') : changeLang('ar');
  }

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    storage.write('lang', langCode);
    Get.updateLocale(locale);
  }
}
