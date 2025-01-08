import 'dart:math';
import 'package:flutter/services.dart';
import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:universal_html/html.dart';

class AppHelper {
  static User get exampleUser => User(
        id: Random().nextInt(1000),
        firstName: 'John',
        lastName: 'Doe',
        username: 'johndoe',
        email: 'GKd3K@example.com',
        phone: '1234567890',
        role: 'Customer',
        image: AppImages.user,
      );

  static Site get exampleSite => Site(
        id: Random().nextInt(1000),
        name: 'Site Name',
        address: 'Address, Street, Home',
      );

  static Store get exampleStore => Store(
        id: Random().nextInt(1000),
        name: 'Store Name',
        description: 'This is Store Descreption',
        site: exampleSite,
        image: AppImages.appLogo,
        tags: ['good', 'potato', 'margin'],
      );

  static Product get exampleProduct => Product.fromJson({
        'id': Random().nextInt(1000),
        'translations': {
          'en': {
            'name': 'Product Name',
            'description':
                'This is Product Descreption This is Product Descreption This is Product Descreption This is Product Descreption.',
          },
          'ar': {
            'name': 'اسم منتج عشوائي',
            'description':
                'هذا هو وصف المنتج العشوائي هذا هو وصف المنتج العشوائي هذا هو وصف المنتج العشوائي هذا هو وصف المنتج العشوائي .',
          },
        },
        'price': Random().nextInt(1000).toString(),
        'image': AppImages.appLogo,
        'tags': ['good', 'product', 'padding'],
        'store_id': exampleStore.id,
        'stock': Random().nextInt(10),
      });

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
    // enable
    //     ? document.documentElement?.requestFullscreen()
    //     : document.exitFullscreen();
  }

  static void hideKeyboard() {
    Get.focusScope?.unfocus();
  }

  static bool get isDarkMode => Get.isDarkMode;

  static String get currentTheme => Get.theme.toString();

  static String get currentLang => Get.locale.toString().substring(0, 2);
  static String get deviceLang => Get.deviceLocale.toString().substring(0, 2);

  static bool get isRtl => currentLang == 'ar';

  static Size get screenSize => Get.size;
  static double get screenHeight => Get.height;
  static double get screenWidth => Get.width;

  static bool isNetworkImage(String image) =>
      image != AppImages.appLogo &&
      image != AppImages.user &&
      image != AppImages.productImage;

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }
}
