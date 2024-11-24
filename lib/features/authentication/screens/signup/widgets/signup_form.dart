import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/common/widgets/login_signup/international_phone_number_input_field.dart';
import 'package:geniego/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:geniego/features/authentication/screens/signup/widgets/signup_terms_and_conditions_check_box.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              // First Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: AppTexts.firstName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),

              const SizedBox(width: AppSizes.spaceBtwInputFields),

              // Last Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: AppTexts.lastName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: AppTexts.username,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: AppTexts.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Phone Number
          const InternationalPhoneNumberInputField(),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: AppTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon: const Icon(Iconsax.eye_slash),
                onPressed: () {},
              ),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwSections),

          // Terms & Conditions Checkbox
          const SignupTermsAndConditionsCheckBox(),

          const SizedBox(height: AppSizes.spaceBtwSections),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
