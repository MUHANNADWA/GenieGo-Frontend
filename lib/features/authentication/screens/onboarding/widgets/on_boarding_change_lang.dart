import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';
import 'package:new_store/utils/device/device_utility.dart';
import 'package:new_store/utils/locale/locale_controller.dart';

class OnBoardingChangeLang extends StatelessWidget {
  const OnBoardingChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final AppLocaleController langController = Get.put(AppLocaleController());

    return Positioned(
      top: AppDeviceUtils.getAppBarHeight(),
      right: isRtl ? AppSizes.defaultSpace : null,
      left: isRtl ? null : AppSizes.defaultSpace,
      child: TextButton(
          onPressed: () => langController.toggleLang(),
          child: Row(
            children: [
              Text('${AppTexts.changeLang()}  '),
              CountryFlag.fromLanguageCode(
                Get.locale!.toString() == 'ar' ? 'en' : 'ar-sy',
                width: 18,
                height: 12,
              ),
            ],
          )),
    );
  }
}
