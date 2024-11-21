import 'package:flutter/material.dart';
import 'package:new_store/utils/constants/image_strings.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';
import 'package:new_store/utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Image.asset(
          dark ? AppImages.lightAppLogo : AppImages.darkAppLogo,
          height: 150,
        ),

        //Title
        Text(
          AppTexts.loginTitle(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const SizedBox(height: AppSizes.sm),

        // SubTitle
        Text(
          AppTexts.loginSubTitle(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
