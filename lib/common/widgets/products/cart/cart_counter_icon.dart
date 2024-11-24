import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/utils/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.shopping_bag,
            color: AppColors.white,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: AppColors.white,
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
