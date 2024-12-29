import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:geniego/utils/locale/locale_controller.dart';
import 'package:geniego/utils/theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final localStorage = GetStorage();

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  //* Settings Variables
  RxString languages = AppTexts.system.obs;
  RxString themes = AppTexts.system.obs;
  RxBool geoLocation = true.obs;
  RxBool notification = true.obs;
  RxBool fullscreen = true.obs;

  @override
  void onInit() {
    super.onInit();
    geoLocation.value = localStorage.read('geoLocation') ?? true;
    notification.value = localStorage.read('notification') ?? true;
    notification.value = localStorage.read('fullscreen') ?? true;
    languages.value = localStorage.read('lang') ?? AppTexts.system;
    themes.value = localStorage.read('theme') ?? AppTexts.system;
  }

  void chnageLang(String lang) {
    AppLocaleController.instance.changeLang(lang);
    languages.value = lang;
  }

  void chnageTheme(String theme) {
    AppThemeController.instance.changeTheme(theme);
    themes.value = theme;
  }

  void toggleGeolocation(value) {
    localStorage.write('geoLocation', value);
    geoLocation.toggle();
  }

  void toggleNotification(value) {
    localStorage.write('notification', value);
    notification.toggle();
  }

  void toggleFullscreen(value) {
    AppHelper.setFullScreen(value);
    localStorage.write('fullscreen', value);
    fullscreen.toggle();
  }

  void logout() {
    AuthService.logout();
    GetStorage().remove('isUserSignedIn');
    Get.offAllNamed(loginScreen);
  }
}
