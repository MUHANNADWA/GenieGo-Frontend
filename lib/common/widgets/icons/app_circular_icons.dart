import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class CircularIcon extends StatelessWidget {
  /// A Custom Circular Icon Widget With A Background Color.
  ///
  ///Properites Are:
  ///Container[width],[height],&[backgroundColor].
  ///
  ///Icon's [size],[color] & [onPressed]

  const CircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: dark
            ? AppColors.black.withOpacity(0.9)
            : AppColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.heart5),
      ),
    );
  }
}
