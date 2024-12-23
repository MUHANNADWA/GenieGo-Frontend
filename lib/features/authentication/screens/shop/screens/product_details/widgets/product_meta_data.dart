import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price And Sale Price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: AppSizes.sm,
              backgroundColor: AppColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: AppColors.black),
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),

            /// Price
            Text(
              '\$ 250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            ProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        )
      ],
    );
  }
}
