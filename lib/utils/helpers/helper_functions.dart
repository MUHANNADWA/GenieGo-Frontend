import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppHelperFunctions {
  static Color? getColor(String value) {
    final colorMap = {
      'Green': Colors.green,
      'Red': Colors.red,
      'Blue': Colors.blue,
      'Pink': Colors.pink,
      'Grey': Colors.grey,
      'Purple': Colors.purple,
      'Black': Colors.black,
      'White': Colors.white,
      'Yellow': Colors.yellow,
      'Orange': Colors.deepOrange,
      'Brown': Colors.brown,
      'Teal': Colors.teal,
      'Indigo': Colors.indigo,
    };
    return colorMap[value];
  }

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

  static Size get screenSize => Get.size;
  static double get screenHeight => Get.height;
  static double get screenWidth => Get.width;

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) => list.toSet().toList();

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    return List.generate(
      (widgets.length / rowSize).ceil(),
      (index) {
        final rowChildren = widgets.sublist(
          index * rowSize,
          (index + 1) * rowSize > widgets.length
              ? widgets.length
              : (index + 1) * rowSize,
        );
        return Row(children: rowChildren);
      },
    );
  }
}
