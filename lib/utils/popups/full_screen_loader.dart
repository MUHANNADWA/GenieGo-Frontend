import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String imaage) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Scaffold(
          body: Container(
            color: AppHelper.isDarkMode ? AppColors.dark : AppColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    imaage,
                    width: AppHelper.screenWidth * 0.6,
                  ),
                  Text(text),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
