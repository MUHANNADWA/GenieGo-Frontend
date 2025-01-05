import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  RxBool isPasswordObscured = true.obs;
  Rx<Icon> passwordIcon = const Icon(Iconsax.eye).obs;

  // Toggle Password
  togglePasswordVisibility() {
    isPasswordObscured.toggle();
    passwordIcon.value = isPasswordObscured.value
        ? const Icon(Iconsax.eye)
        : const Icon(Iconsax.eye_slash);
  }

  // Variables
  final firstName =
      TextEditingController(text: AuthService.currentUser.firstName);
  final lastName =
      TextEditingController(text: AuthService.currentUser.lastName);
  final username =
      TextEditingController(text: AuthService.currentUser.username);
  final email = TextEditingController(text: AuthService.currentUser.email);
  final phone = TextEditingController(text: AuthService.currentUser.phone);
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateUserInfo() async {
    try {
      // Form Validation
      if (!formKey.currentState!.validate()) return;

      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Updating your Profile..',
        'Working behind the scenes to get things ready.',
        AppImages.loading,
      );

      final userData = {
        'first_name': firstName.text.trim(),
        'last_name': lastName.text.trim(),
        'username': username.text.trim(),
        'email': email.text.trim(),
        'phone': phone.text.trim(),
        'password': password.text.trim(),
      };

      // Update User
      await AuthService.updateUserById(userData);

      // Stop Loading
      AppDialogs.hideDialog();

      AppLoaders.infoSnackBar(
          title: 'Saved!', message: 'Your Info Has Been Updated');

      // Return back
      Get.back();
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
