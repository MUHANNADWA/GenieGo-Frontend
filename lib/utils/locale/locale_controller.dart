import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppLocaleController extends GetxController {
  final storage = GetStorage();

  Locale initialLang() {
    return storage.read('lang') == null
        ? Get.deviceLocale!
        : Locale(storage.read('lang'));
  }

  void toggleLang() {
    Get.locale == const Locale('ar') ? changeLang('en') : changeLang('ar');
  }

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    storage.write('lang', langCode);
    Get.updateLocale(locale);
  }
}
