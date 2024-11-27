import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A circular loader widget with customizable foreground and background colors.
class AppCircularLoader extends StatelessWidget {
  /// Default constructor for the AppCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const AppCircularLoader({
    super.key,
    this.foregroundColor = AppColors.white,
    this.backgroundColor = AppColors.primary,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      child: Center(
        child: CircularProgressIndicator(
          color: foregroundColor,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
