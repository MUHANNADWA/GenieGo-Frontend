import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/common/widgets/login_signup/international_phone_number_input_field.dart';
import 'package:geniego/features/authentication/controllers/login/login_controller.dart';
import 'package:geniego/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:geniego/features/authentication/screens/signup/signup_screen.dart';
import 'package:geniego/navigation_menu.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Obx(
          () => Column(
            children: [
              // Show Email Feild If The Chosed To Sign In With Email
              controller.isEmailScreen.value
                  ? TextFormField(
                      decoration: InputDecoration(
                        labelText: AppTexts.email,
                        prefixIcon: const Icon(Iconsax.direct),
                      ),
                    )
                  : const SizedBox(),

              // Show Phone Number Feild If The Chosed To Sign In With Phone Number
              controller.isPhoneNumberScreen.value
                  ? const InternationalPhoneNumberInputField()
                  : const SizedBox(),

              // Show Username Feild If The Chosed To Sign In With Username
              controller.isUsernameScreen.value
                  ? TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: AppTexts.username,
                        prefixIcon: const Icon(Iconsax.user_edit),
                      ),
                    )
                  : const SizedBox(),

              const SizedBox(height: AppSizes.spaceBtwInputFields),

              // Password
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.eye_slash),
                    onPressed: () {},
                  ),
                ),
                obscureText: true,
              ),

              const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

              // Remember Me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember Me
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(AppTexts.rememberMe)
                    ],
                  ),

                  // Forgot Password
                  TextButton(
                    onPressed: () => Get.to(() => const ForgotPasswordScreen()),
                    child: Text(AppTexts.forgotPassword),
                  )
                ],
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // SignIn Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigationMenu()),
                  child: Text(AppTexts.signIn),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
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
