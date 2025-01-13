import 'package:flutter/material.dart';
import 'package:geniego/features/shop/controllers/cart/cart_controller.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({
    super.key,
    required this.child,
    this.badgeColor,
    this.alignment = const Alignment(0.5, -0.5),
  });

  final Widget child;
  final Color? badgeColor;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(() => controller.cartItems.isNotEmpty
        ? Badge(
            label: Text(controller.cartItems.length.toString(),
                style: TextStyle(color: AppColors.white)),
            alignment: alignment,
            backgroundColor: badgeColor ?? AppColors.primary,
            child: child,
          )
        : child);
  }
}
