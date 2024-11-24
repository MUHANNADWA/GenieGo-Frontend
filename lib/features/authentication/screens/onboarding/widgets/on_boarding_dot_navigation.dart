import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/device/device_utility.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = AppHelper.isDarkMode;
    final isRtl = AppHelper.isRtl;

    return Positioned(
      bottom: AppDeviceUtils.bottomNavigationBarHeight + 25,
      right: isRtl ? AppSizes.defaultSpace : null,
      left: isRtl ? null : AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          dotHeight: 6,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
      ),
    );
  }
}
