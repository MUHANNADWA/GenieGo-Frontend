import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  Future<void> logout() async {
    try {
      AppDialogs.showConfirmationDialog(
        title: 'Confirm Logout',
        description:
            'Are you sure you want to Log out? This action will end your session now.',
        confirmText: 'Logout',
        onConfirm: () async {
          await AuthService.logout();
          GetStorage().remove('token');
          Get.offAllNamed(loginScreen);
        },
      );
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> deleteAccount(id) async {
    try {
      AppDialogs.showConfirmationDialog(
        title: 'Confirm Deletion',
        description:
            'Are you sure you want to delete your account? This action cannot be undone.',
        confirmText: 'Delete',
        onConfirm: () async {
          Get.back();
          await AuthService.deleteUserById(id);
          AppLoaders.errorSnackBar(
              title: 'Deleted!',
              message:
                  'Your Account Has been Deleted Successfully, Your Session Will end soon');
          Get.offAllNamed(loginScreen);
        },
      );
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

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

  Future<void> updateUserInfo({File? profileImage}) async {
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

      final response = profileImage != null
          ? await AuthService.updateUserWithImage(userData, profileImage)
          : await AuthService.updateUser(userData);

      final user = User.fromJson(response['data']['user']);

      await GetStorage().write('user', user.toJson());

      // Stop Loading
      AppDialogs.hideDialog();

      AppLoaders.infoSnackBar(
          title: 'Saved!', message: 'Your Info Has Been Updated');
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
