import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/device/device_utility.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = AppHelper.isRtl;

    return Positioned(
      top: AppDeviceUtils.appBarHeight,
      right: isRtl ? null : AppSizes.defaultSpace,
      left: isRtl ? AppSizes.defaultSpace : null,
      child: TextButton(
          onPressed: OnBoardingController.instance.skipPage,
          child: Text(AppTexts.skip)),
    );
  }
}
