import 'package:flutter/material.dart';
import 'package:geniego/features/shop/screens/cart/widgets/cart.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/utils/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text('2'),
      alignment: Alignment(0.5, -0.5),
      backgroundColor: AppColors.light,
      child: IconButton(
        onPressed: () => Get.to(() => CartScreen()),
        icon: const Icon(
          Iconsax.shopping_bag,
          color: AppColors.white,
        ),
      ),
    );
  }
}
