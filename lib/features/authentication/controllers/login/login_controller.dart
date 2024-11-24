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

  setLoginScreenToUsername() {
    isPhoneNumberScreen.value = false;
    isUsernameScreen.value = true;
    isEmailScreen.value = false;
  }

  setLoginScreenToEmail() {
    isPhoneNumberScreen.value = false;
    isUsernameScreen.value = false;
    isEmailScreen.value = true;
  }

  // // Jump to the specific dot selected page.
  // void dotNavigationClick(index) {
  //   currentPageIndex.value = index;
  // }

  // // Update Current Index & jump to next page
  // void nextPage() {
  //   if (currentPageIndex.value == 2) {
  //     Get.offAll(() => const LoginScreen());
  //   } else {
  //     currentPageIndex.value + 1;
  //   }
  // }

  // // Update Current Index & jump to the last Page
  // void skipPage() {
  //   currentPageIndex.value = 2;
  // }
}
