import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/network_manager.dart';
import 'package:geniego/utils/http/http_client.dart';
import 'package:geniego/utils/popups/app_dialogs.dart';
import 'package:geniego/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'dart:developer';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //* First Control Field Logic
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

  //* Toggle Password And Remember Me
  Rx<bool> rememberMe = true.obs;
  Rx<bool> isPasswordObscured = true.obs;
  Rx<Icon> passwordIcon = const Icon(Iconsax.eye).obs;

  // Toggle Password
  togglePasswordVisibility() {
    isPasswordObscured.toggle();
    passwordIcon.value = isPasswordObscured.value
        ? const Icon(Iconsax.eye)
        : const Icon(Iconsax.eye_slash);
  }

  //* Login Variables
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late dynamic userCredentials;

  //* Login
  Future<void> login() async {
    try {
      log('I am here');
      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Processing your request..',
        'Working behind the scenes to get things ready.',
        AppImages.loading,
      );

      log('I am here 2');
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please Check You internet connection',
        );
        return;
      }

      final userData = {
        'username': username.text,
        // 'email': email.text,
        // 'phone': phoneNumber.text,
        'password': password.text
      };

      log('I am here 3');
      // Form Validation
      if (!loginFormKey.currentState!.validate()) return;
      log('I am here 4');

      log('hello1');
      // Rabt For Megaamms
      userCredentials = await AppHttpHelper.post('login', userData);

      log('hello2');
      // log(userCredentials.toString());
    } catch (e) {
      // log(userCredentials.toString());
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      AppDialogs.hideDialog();
    }
  }
}
