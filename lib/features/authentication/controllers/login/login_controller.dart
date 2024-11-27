import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  Rx<bool> isPhoneNumberScreen = true.obs;
  Rx<bool> isUsernameScreen = false.obs;
  Rx<bool> isEmailScreen = false.obs;

  // Change Screen To Login With Phone Number
  setLoginScreenToPhoneNumber() {
    isPhoneNumberScreen.value = true;
    isUsernameScreen.value = false;
    isEmailScreen.value = false;
  }

  // Change Screen To Login With User Name
  setLoginScreenToUsername() {
    isPhoneNumberScreen.value = false;
    isUsernameScreen.value = true;
    isEmailScreen.value = false;
  }

  // Change Screen To Login With Email
  setLoginScreenToEmail() {
    isPhoneNumberScreen.value = false;
    isUsernameScreen.value = false;
    isEmailScreen.value = true;
  }
}
