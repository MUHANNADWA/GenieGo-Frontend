import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_store/features/authentication/screens/login/login_screen.dart';
import 'package:new_store/features/authentication/screens/signup/signup_screen.dart';
import 'package:new_store/features/authentication/screens/signup/success_screen.dart';
import 'package:new_store/utils/constants/image_strings.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';
import 'package:new_store/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Get.offAll(() => const LoginScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image.asset(
                AppImages.deliveredEmailIllustration,
                width: AppHelperFunctions.screenWidth() * 0.6,
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Title
              Text(
                AppTexts.confirmEmail(),
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Email
              Text(
                'suppot@muhannadwahbeh.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // SubTitle
              Text(
                AppTexts.confirmEmailSubTitle(),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const SuccessScreen()),
                  child: Text(AppTexts.tContinue()),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Resend Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: Text(AppTexts.resendEmail()),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Buttons
            ],
          ),
        ),
      ),
    );
  }
}
