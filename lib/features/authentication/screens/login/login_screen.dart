import 'package:flutter/material.dart';
import 'package:new_store/common/styles/spacing_styles.dart';
import 'package:new_store/features/authentication/screens/login/widgets/login_Header.dart';
import 'package:new_store/common/widgets/login_signup/form_divider.dart';
import 'package:new_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:new_store/common/widgets/login_signup/social_buttons.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';

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
              FormDivider(dividerText: AppTexts.orSignInWith().toUpperCase()),

              const SizedBox(height: AppSizes.spaceBtwSections),

              // Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
