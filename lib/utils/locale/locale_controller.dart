import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class AppLocaleController extends GetxController {
  static AppLocaleController get instance => Get.find();
  final localStorage = GetStorage();

  Locale get initialLang => localStorage.read('lang') == null
      ? Get.deviceLocale!
      : langCode(localStorage.read('lang'));

  void toggleLang() => AppHelper.currentLang == 'ar'
      ? changeLang(AppTexts.english)
      : changeLang(AppTexts.arabic);

  void changeLang(String lang) async {
    Get.updateLocale(langCode(lang));
    await localStorage.write('lang', lang);
  }

  Locale langCode(lang) {
    return Locale(
      lang == AppTexts.system
          ? Get.deviceLocale!.languageCode
          : lang == 'العربية'
              ? 'ar'
              : 'en',
    );
  }
}
