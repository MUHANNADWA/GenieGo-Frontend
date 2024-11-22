import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_store/common/widgets/login_signup/international_phone_number_input_field.dart';
import 'package:new_store/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:new_store/features/authentication/screens/signup/signup_screen.dart';
import 'package:new_store/navigation_menu.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            // // Email
            // TextFormField(
            //   decoration: InputDecoration(
            //     labelText: AppTexts.email(),
            //     prefixIcon: const Icon(Iconsax.direct),
            //   ),
            // ),

            // const SizedBox(height: AppSizes.spaceBtwInputFields),

            // Phone Number
            const InternationalPhoneNumberInputField(),

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
    );
  }
}
