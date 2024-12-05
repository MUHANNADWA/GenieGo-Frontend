import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:get/get.dart';
import 'package:geniego/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:geniego/features/authentication/screens/onboarding/widgets/on_boarding_change_lang.dart';
import 'package:geniego/features/authentication/screens/onboarding/widgets/on_boarding_dot_navigation.dart';
import 'package:geniego/features/authentication/screens/onboarding/widgets/on_boarding_next_button.dart';
import 'package:geniego/features/authentication/screens/onboarding/widgets/on_boarding_skip.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Horizontal Scrollabe Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              AppDefaultPage(
                image: AppImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              AppDefaultPage(
                image: AppImages.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),
              AppDefaultPage(
                image: AppImages.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Change Language Button
          const OnBoardingChangeLang(),

          // Dot Navigaton SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
