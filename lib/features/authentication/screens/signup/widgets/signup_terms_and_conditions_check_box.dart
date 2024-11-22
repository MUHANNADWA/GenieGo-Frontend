import 'package:flutter/material.dart';
import 'package:new_store/utils/constants/colors.dart';
import 'package:new_store/utils/constants/sizes.dart';
import 'package:new_store/utils/constants/text_strings.dart';
import 'package:new_store/utils/helpers/helper_functions.dart';

class SignupTermsAndConditionsCheckBox extends StatelessWidget {
  const SignupTermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode;

    return Row(
      children: [
        // Checkbox
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),

        const SizedBox(width: AppSizes.spaceBtwItems),

        // I Agree To Privacy Policy And Terms Of Use
        Text.rich(
          TextSpan(
            children: [
              // I Agree To
              TextSpan(
                text: '${AppTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              // Privacy Policy
              TextSpan(
                text: AppTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? AppColors.white : AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? AppColors.white : AppColors.primary,
                    ),
              ),

              // And
              TextSpan(
                text: ' ${AppTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              // Terms Of Use
              TextSpan(
                text: AppTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? AppColors.white : AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? AppColors.white : AppColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
