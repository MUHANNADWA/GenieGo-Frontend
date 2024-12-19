import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 270,
    required this.itemBuilder,
    this.crossAxisCount = 2,
  });

  final int itemCount;
  final int crossAxisCount;
  final double mainAxisExtent;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: AppSizes.gridViewSpacing,
        crossAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
