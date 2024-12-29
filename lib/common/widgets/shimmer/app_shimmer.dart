import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppHelper.isDarkMode ? AppColors.dark : AppColors.light,
      highlightColor:
          AppHelper.isDarkMode ? AppColors.darkerGrey : AppColors.darkGrey,
      child: child,
    );
  }
}
