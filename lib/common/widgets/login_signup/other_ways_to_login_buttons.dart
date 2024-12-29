import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/features/authentication/controllers/login/login_controller.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class OtherWaysToLoginButtons extends StatelessWidget {
  const OtherWaysToLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // User Name
          !controller.isUsernameScreen.value
              ? Expanded(
                  child: OutlinedButton.icon(
                    label: Text(AppTexts.username),
                    onPressed: () => controller.setLoginScreenToUsername(),
                    icon: const Icon(Iconsax.user),
                  ),
                )
              : const SizedBox(),

          controller.isPhoneNumberScreen.value
              ? const SizedBox(width: AppSizes.spaceBtwItems)
              : const SizedBox(),

          // Email
          !controller.isEmailScreen.value
              ? Expanded(
                  child: OutlinedButton.icon(
                    label: Text(AppTexts.email),
                    onPressed: () => controller.setLoginScreenToEmail(),
                    icon: const Icon(Iconsax.direct),
                  ),
                )
              : const SizedBox(),

          controller.isUsernameScreen.value || controller.isEmailScreen.value
              ? const SizedBox(width: AppSizes.spaceBtwItems)
              : const SizedBox(),

          // Phone Number
          !controller.isPhoneNumberScreen.value
              ? Expanded(
                  child: OutlinedButton.icon(
                    label: Text(AppTexts.phoneNo),
                    onPressed: () => controller.setLoginScreenToPhoneNumber(),
                    icon: const Icon(Iconsax.call),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
