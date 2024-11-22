import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_store/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                AppTexts.forgotPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // SubTitle
              Text(
                AppTexts.forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),

              const SizedBox(height: AppSizes.spaceBtwSections * 2),

              // Email Text Feild
              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  labelText: AppTexts.email,
                  prefixIcon: const Icon(Iconsax.direct),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPasswordScreen()),
                  child: Text(AppTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
