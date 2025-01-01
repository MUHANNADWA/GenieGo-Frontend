import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/network_manager.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //* First Control Field Logic
  RxBool isPhoneNumberScreen = true.obs;
  RxBool isUsernameScreen = false.obs;
  RxBool isEmailScreen = false.obs;

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

  //* Toggle Password
  RxBool isPasswordObscured = true.obs;
  Rx<Icon> passwordIcon = const Icon(Iconsax.eye).obs;

  // Toggle Password
  togglePasswordVisibility() {
    isPasswordObscured.toggle();
    passwordIcon.value = isPasswordObscured.value
        ? const Icon(Iconsax.eye)
        : const Icon(Iconsax.eye_slash);
  }

  //* Login Variables
  RxString phoneNumber = ''.obs;
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //* Login
  Future<void> login() async {
    try {
      // Form Validation
      if (!loginFormKey.currentState!.validate()) return;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoaders.errorSnackBar(
          title: AppTexts.noInternetSnackBarTitle,
          message: AppTexts.noInternetSnackBarTitle,
        );
        return;
      }

      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Processing your request..',
        'Working behind the scenes to get things ready.',
        AppImages.loading,
      );

      final userData = {
        if (isUsernameScreen.value) 'username': username.text.trim(),
        if (isEmailScreen.value) 'email': email.text.trim(),
        if (isPhoneNumberScreen.value) 'phone': phoneNumber.value,
        'password': password.text.trim()
      };

      User user;
      // Login User
      if (dotenv.env['ENV']?.trim() != 'development') {
        final response = await AuthService.login(userData);

        user = User.fromJson(response['data']['user']);
        // user = User.fromJson(AppHelper.exampleUser.toJson());

        await GetStorage().write('user', user.toJson());

        // Store User Status
        GetStorage().write('token', response['data']['token']);
      }

      // Stop Loading
      await AppDialogs.hideDialog();

      // Navigate To Navigation Menu
      Get.toNamed(mainScreen);
    } catch (e) {
      AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
