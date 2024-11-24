import 'package:flutter/material.dart';
import 'package:geniego/common/styles/spacing_styles.dart';
import 'package:geniego/features/authentication/screens/login/widgets/login_Header.dart';
import 'package:geniego/common/widgets/login_signup/form_divider.dart';
import 'package:geniego/features/authentication/screens/login/widgets/login_form.dart';
import 'package:geniego/common/widgets/login_signup/other_ways_to_login_buttons.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title and SubTitle
              const LoginHeader(),

              // Login Form
              const LoginForm(),

              // Divider
              FormDivider(dividerText: AppTexts.orSignInWith.toUpperCase()),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Footer
              const OtherWaysToLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
