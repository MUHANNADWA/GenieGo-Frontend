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
          // Username Button
          if (controller.currentScreen.value != LoginScreen.username)
            Expanded(
              child: OutlinedButton.icon(
                label: Text(AppTexts.username),
                onPressed: () =>
                    controller.setLoginScreen(LoginScreen.username),
                icon: const Icon(Iconsax.user),
              ),
            ),

          if (controller.currentScreen.value != LoginScreen.phoneNumber)
            const SizedBox(width: AppSizes.spaceBtwItems),

          // Email Button
          if (controller.currentScreen.value != LoginScreen.email)
            Expanded(
              child: OutlinedButton.icon(
                label: Text(AppTexts.email),
                onPressed: () => controller.setLoginScreen(LoginScreen.email),
                icon: const Icon(Iconsax.direct),
              ),
            ),

          if (controller.currentScreen.value != LoginScreen.username &&
              controller.currentScreen.value != LoginScreen.email)
            const SizedBox(width: AppSizes.spaceBtwItems),

          // Phone Number Button
          if (controller.currentScreen.value != LoginScreen.phoneNumber)
            Expanded(
              child: OutlinedButton.icon(
                label: Text(AppTexts.phoneNo),
                onPressed: () =>
                    controller.setLoginScreen(LoginScreen.phoneNumber),
                icon: const Icon(Iconsax.call),
              ),
            ),
        ],
      ),
    );
  }
}
