import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/controllers/signup/signup_controller.dart';
import 'package:geniego/utils/validator/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/common/widgets/login_signup/international_phone_number_input_field.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      AppValidator.validateEmptyText(AppTexts.firstName, value),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      AppValidator.validateEmptyText(AppTexts.lastName, value),
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) =>
                AppValidator.validateEmptyText(AppTexts.username, value),
            decoration: InputDecoration(
              labelText: AppTexts.username,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: AppTexts.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Phone Number
          const InternationalPhoneNumberInputField<SignupController>(),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => AppValidator.validatePassword(value),
              obscureText: controller.isPasswordObscured.value,
              decoration: InputDecoration(
                labelText: AppTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: controller.passwordIcon.value,
                  onPressed: () => controller.togglePasswordVisibility(),
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password Confirmation
          Obx(
            () => TextFormField(
              controller: controller.passwordConfirmation,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => AppValidator.validatePasswordConfirmation(
                  value, controller.password.text),
              obscureText: controller.isPasswordConfirmationObscured.value,
              decoration: InputDecoration(
                labelText: AppTexts.passwordConfirmation,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: controller.passwordConfirmationIcon.value,
                  onPressed: () =>
                      controller.togglePasswordConfirmationVisibility(),
                ),
              ),
            ),
          ),

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
