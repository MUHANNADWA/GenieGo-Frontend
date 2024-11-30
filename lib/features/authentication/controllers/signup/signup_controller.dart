import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/image_strings.dart';
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
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //* Signup
  Future<void> signup() async {
    try {
      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Hang tight, we\'re almost there..',
        'Please wait while we gather the required data...',
        AppImages.loading,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please Check You internet connection',
        );
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      //
    } catch (e) {
      AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      AppDialogs.hideDialog();
    }
  }
}
