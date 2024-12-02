import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/products/product_Cards/Product_Card_Vertical.dart';
import 'package:geniego/utils/constants/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxesExtent = 288,
    required this.itemBuilder,
  });
  final int itemCount;
  final double mainAxesExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppSizes.gridViewSpacing,
          crossAxisSpacing: AppSizes.gridViewSpacing,
          mainAxisExtent: 288,
        ),
        itemBuilder: itemBuilder);
  }
}
