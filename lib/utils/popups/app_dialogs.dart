import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/default_page/app_default_page.dart';
import 'package:geniego/common/widgets/no_internet_connecntion/no_internet_connention_page.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:geniego/utils/loaders/circular_loader.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';

class AppDialogs {
  // Loading Dialog
  static void showFullScreenLoadingDialog(
    String title,
    String subTitle,
    String animation,
  ) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AppHelper.isDarkMode ? AppColors.dark : AppColors.white,
          child: Column(
            children: [
              AppDefaultPage(
                image: animation,
                title: title,
                subTitle: subTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Loading dialog
  static void showLoadingDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) => const PopScope(
        canPop: true,
        child: AppCircularLoader(),
      ),
    );
  }

  // No Internet Dialog
  static void showNoInternetDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AppHelper.isDarkMode ? AppColors.dark : AppColors.white,
          child: const NoInternetConnentionPage(),
        ),
      ),
    );
  }

  // Hide Current Dialog
  static hideDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
