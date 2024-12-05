import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:get/get.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDefaultPage(
          image: AppImages.onBoardingImage1,
          title: 'Page Not Found.',
          subTitle: 'It seems like there\'s no page like this. Return to home.',
          showActionButton: true,
          actionButtonText: 'Return to home',
          onPressedActionButton: () => Get.offAllNamed(mainScreen),
        ),
      ],
    );
  }
}
