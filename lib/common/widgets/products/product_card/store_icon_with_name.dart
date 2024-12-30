import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';

class StoreIconWithName extends StatelessWidget {
  const StoreIconWithName({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCircularImage(
          image: store.image,
          width: 24,
          height: 24,
          overlayColor: AppColors.darkLightInvert,
          boxFit: BoxFit.contain,
        ),

        const SizedBox(width: AppSizes.sm),

        // Store Name
        ProductStoreTitleText(
          title: store.name,
          smallSize: true,
        ),
      ],
    );
  }
}
