import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode;

    return Row(
      children: [
        // Left Line
        Flexible(
            child: Divider(
          color: dark ? AppColors.darkGrey : AppColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),

        // OrSignInWith Text
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),

        // Right Line
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
