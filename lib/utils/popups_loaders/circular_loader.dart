import 'package:flutter/material.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class AppCircularLoader extends StatelessWidget {
  const AppCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppHelper.isDarkMode ? AppColors.white : AppColors.primary;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: AppSizes.appBarHeight),
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
