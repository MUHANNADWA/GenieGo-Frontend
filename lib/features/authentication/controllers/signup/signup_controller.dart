import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/helpers/network_manager.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //* Toggle Password
  Rx<bool> isPasswordObscured = true.obs;
  Rx<bool> isPasswordConfirmationObscured = true.obs;
  Rx<Icon> passwordIcon = const Icon(Iconsax.eye).obs;
  Rx<Icon> passwordConfirmationIcon = const Icon(Iconsax.eye).obs;

  // Toggle Password
  togglePasswordVisibility() {
    isPasswordObscured.toggle();
    passwordIcon.value = isPasswordObscured.value
        ? const Icon(Iconsax.eye)
        : const Icon(Iconsax.eye_slash);
  }

  // Toggle Password
  togglePasswordConfirmationVisibility() {
    isPasswordConfirmationObscured.toggle();
    passwordConfirmationIcon.value = isPasswordConfirmationObscured.value
        ? const Icon(Iconsax.eye)
        : const Icon(Iconsax.eye_slash);
  }

  //* Signup Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  Rx<String> phoneNumber = ''.obs;
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //* Signup
  Future<void> signup() async {
    try {
      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please Check Your Internet Connection',
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
        'first_name': firstName.text,
        'last_name': lastName.text,
        'username': username.text,
        'email': email.text,
        'phone': phoneNumber.value,
        'password': password.text,
        'password_confirmation': passwordConfirmation.text
      };

      // Signup User
      if (dotenv.env['ENV'] != 'development') {
        await AuthService.signup(userData);
      }

      // Stop Loading
      await AppDialogs.hideDialog();

      // Navigate To Navigation Menu
      Get.toNamed(mainScreen);
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
