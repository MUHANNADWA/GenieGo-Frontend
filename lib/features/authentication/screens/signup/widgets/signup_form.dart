import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/controllers/signup/signup_controller.dart';
import 'package:geniego/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/common/widgets/login_signup/international_phone_number_input_field.dart';
import 'package:geniego/features/authentication/screens/signup/widgets/signup_terms_and_conditions_check_box.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              // First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      AppValidator.validateEmptyText('First Name', value),
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
                  controller: controller.lastName,
                  validator: (value) =>
                      AppValidator.validateEmptyText('Last Name', value),
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
            controller: controller.username,
            validator: (value) =>
                AppValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
              labelText: AppTexts.username,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              labelText: AppTexts.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Phone Number
          InternationalPhoneNumberInputField(
            controller: controller.phoneNumber,
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: controller.password,
            validator: (value) => AppValidator.validatePassword(value),
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
              onPressed: () => controller.signup(),
              child: Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
