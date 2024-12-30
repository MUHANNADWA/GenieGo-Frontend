import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, required this.child, this.badgeColor});

  final Widget child;
  final Color? badgeColor;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text('2', style: TextStyle(color: AppColors.white)),
      alignment: Alignment(0.5, -0.5),
      backgroundColor: badgeColor ?? AppColors.primary,
      child: child,
    );
  }
}
