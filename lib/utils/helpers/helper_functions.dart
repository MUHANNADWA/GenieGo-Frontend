import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppHelper {
  static void showSnackBar(String message) {
    Get.snackbar(
      'Notification',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );
  }

  static void showAlert(String title, String message) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      textConfirm: 'OK',
      onConfirm: () => Get.back(),
    );
  }

  static String truncateText(String text, int maxLength) =>
      text.length <= maxLength ? text : '${text.substring(0, maxLength)}...';

  static bool get isDarkMode => Get.isDarkMode;

  static String get currentLang => Get.locale.toString();

  static bool get isRtl => currentLang == 'ar';

  static Size get screenSize => Get.size;
  static double get screenHeight => Get.height;
  static double get screenWidth => Get.width;

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }
}
