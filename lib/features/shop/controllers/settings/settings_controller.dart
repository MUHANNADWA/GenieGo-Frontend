import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:geniego/utils/locale/locale_controller.dart';
import 'package:geniego/utils/theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

final localStorage = GetStorage();

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  //* Settings Variables
  List<String> languages = [AppTexts.system, AppTexts.english, AppTexts.arabic];
  List<String> themes = [AppTexts.system, AppTexts.dark, AppTexts.light];
  RxString language = AppTexts.system.obs;
  RxString theme = AppTexts.system.obs;
  RxBool geoLocation = false.obs;
  RxBool notification = false.obs;
  RxBool fullscreen = false.obs;

  @override
  void onInit() {
    super.onInit();
    geoLocation.value = localStorage.read('geoLocation') ?? false;
    notification.value = localStorage.read('notification') ?? false;
    fullscreen.value = localStorage.read('fullscreen') ?? false;
    language.value = localStorage.read('lang') ?? AppTexts.system;
    theme.value = localStorage.read('theme') ?? AppTexts.system;
  }

  void chnageLang(String lang) {
    AppLocaleController.instance.changeLang(lang);
    language.value = lang;
  }

  void chnageTheme(String theme) {
    AppThemeController.instance.changeTheme(theme);
    this.theme.value = theme;
  }

  void toggleGeolocation(value) async {
    await localStorage.write('geoLocation', value);
    geoLocation.toggle();
  }

  void toggleNotification(value) async {
    if (value) {
      await Permission.notification.isDenied.then((value) {
        if (value) {
          Permission.notification.request();
        }
      });
    }

    value
        ? FlutterBackgroundService().startService()
        : FlutterBackgroundService().invoke('stopService');

    await localStorage.write('notification', value);
    notification.toggle();
  }

  void toggleFullscreen(value) async {
    AppHelper.setFullScreen(value);
    await localStorage.write('fullscreen', value);
    fullscreen.toggle();
  }

  void logout() async {
    await AuthService.logout();
    GetStorage().remove('token');
    Get.offAllNamed(loginScreen);
  }
}
