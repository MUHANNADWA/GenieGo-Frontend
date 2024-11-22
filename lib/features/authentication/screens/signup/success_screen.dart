import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_store/common/styles/spacing_styles.dart';
import 'package:new_store/features/authentication/screens/login/login_screen.dart';
import 'package:new_store/utils/constants/image_strings.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';
import 'package:new_store/utils/helpers/helper_functions.dart';

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
                width: AppHelperFunctions.screenWidth * 0.6,
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
