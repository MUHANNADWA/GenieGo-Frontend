import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:new_store/utils/constants/colors.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/device/device_utility.dart';
import 'package:new_store/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Positioned(
      bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
      right: isRtl ? null : AppSizes.defaultSpace,
      left: isRtl ? AppSizes.defaultSpace : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? AppColors.primary : AppColors.black,
        ),
        onPressed: OnBoardingController.instance.nextPage,
        child: Icon(isRtl ? Iconsax.arrow_left_2 : Iconsax.arrow_right_3),
      ),
    );
  }
}
