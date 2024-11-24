import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geniego/common/styles/spacing_styles.dart';
import 'package:geniego/features/authentication/screens/login/login_screen.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image.asset(
                AppImages.staticSuccessIllustration,
                width: AppHelper.screenWidth * 0.6,
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Title
              Text(
                AppTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // SubTitle
              Text(
                AppTexts.yourAccountCreatedSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: Text(AppTexts.tContinue),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
