import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/icons/app_circular_icons.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Positioned(
        top: 0,
        right: 0,
        child: CircularIcon(
          icon: Iconsax.heart5,
          color: AppColors.error,
        ),
      ),
    );
  }
}
