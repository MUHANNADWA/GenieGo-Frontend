import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:get/get.dart';
import 'package:geniego/features/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  Rx<String> countryCode = 'SY'.obs;

  // Update Current Index When Page Scrolled
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump To The Specific Dot Selected Page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update Current Index & jump to next page
  void nextPage() async {
    // If Last Page Show Full Screen Loader While Getting Country Code
    if (currentPageIndex.value == 2) {
      // Start The Loader
      AppDialogs.showFullScreenLoadingDialog(
        'Getting things ready...',
        'Hold on, we\'re getting everything ready for you!',
        AppImages.loading,
      );

      // Getting Country Code
      if (dotenv.env['ENV'] != 'development') {
        countryCode.value = await getCountryCode() ?? 'SY';
      }

      // Stop The Loader
      AppDialogs.hideDialog();

      // Navigate To Login Screen
      Get.offAll(() => const LoginScreen());
    } else {
      // Else Jump To The Next Page
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index & Jump To The Last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  // Get Country Code From Ipify Package
  Future<String?> getCountryCode() async {
    // TODO: Uncomment Those & Delete The Last Return Statment

    // Get The IPV4 From Ipify
    // final ipv4 = await Ipify.ipv4();

    // Get The Geo Location From Ipify
    // final geo = await Ipify.geo(dotenv.env['IPIFY_GEO_KEY']!, ip: ipv4);

    // Return The Country Code From Geo Location
    // final countryCode = geo.location!.country.toString();

    // return countryCode;

    return 'SY';
  }
}
