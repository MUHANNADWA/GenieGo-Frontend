import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/validator/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/common/widgets/login_signup/international_phone_number_input_field.dart';
import 'package:geniego/features/authentication/controllers/login/login_controller.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.xl),
        child: Obx(
          () => Column(
            children: [
              Obx(
                () =>
                    // Show Email Feild If The Chosed To Sign In With Email
                    controller.currentScreen.value == LoginScreen.email
                        ? TextFormField(
                            controller: controller.email,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                AppValidator.validateEmail(value),
                            decoration: InputDecoration(
                              labelText: AppTexts.email,
                              prefixIcon: const Icon(Iconsax.direct),
                            ),
                          )

                        // Show Phone Number Feild If The Chosed To Sign In With Phone Number
                        : controller.currentScreen.value ==
                                LoginScreen.phoneNumber
                            ? const InternationalPhoneNumberInputField<
                                LoginController>()

                            // Show Username Feild If The Chosed To Sign In With Username
                            : TextFormField(
                                controller: controller.username,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) =>
                                    AppValidator.validateEmptyText(
                                        AppTexts.username, value),
                                decoration: InputDecoration(
                                  labelText: AppTexts.username,
                                  prefixIcon: const Icon(Iconsax.user_edit),
                                ),
                              ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),

              // Password
              TextFormField(
                controller: controller.password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    AppValidator.validateEmptyText(AppTexts.password, value),
                decoration: InputDecoration(
                  labelText: AppTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: controller.passwordIcon.value,
                    onPressed: () => controller.togglePasswordVisibility(),
                  ),
                ),
                obscureText: controller.isPasswordObscured.value,
              ),

              const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

              // Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Forgot Password
                  TextButton(
                    onPressed: () => Get.toNamed(forgotPasswordScreen),
                    child: Text(AppTexts.forgotPassword),
                  )
                ],
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async => await controller.login(),
                  child: Text(AppTexts.signIn),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.toNamed(signupScreen),
                  child: Text(AppTexts.createAccount),
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
