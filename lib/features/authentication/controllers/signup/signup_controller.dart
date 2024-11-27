import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/network_manager.dart';
import 'package:geniego/utils/popups/full_screen_loader.dart';
import 'package:geniego/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

// Signup
  Future<void> signup() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'Gathering You data...', AppImages.onBoardingImage1);

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
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      AppFullScreenLoader.stopLoading();
    }
  }
}
