import 'package:flutter/material.dart';
import 'package:new_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';
import 'package:new_store/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

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
