import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_rounded_image.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        RoundedImage(
          imageUrl: product.image,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(AppSizes.sm),
          backgroundColor:
              AppHelper.isDarkMode ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),

        /// Title,Price,& Size
        Expanded(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.store.name),
                Flexible(
                    child: ProductStoreTitleText(
                        title: product.name, maxLines: 1)),

                /// Attributes
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'Color ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Green ',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: 'Size ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'UK 08',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ]),
                ),
              ]),
        ),
      ],
    );
  }
}
