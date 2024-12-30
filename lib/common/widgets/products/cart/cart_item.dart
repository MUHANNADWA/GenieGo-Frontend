import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_rounded_image.dart';
import 'package:geniego/common/widgets/products/cart/add_remove_button.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
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
    return Column(
      children: [
        // Card
        ListTile(
          // isThreeLine: true,
          leading: RoundedImage(
            image: product.image,
            width: 60,
            height: 80,
            padding: EdgeInsets.all(AppSizes.sm),
            backgroundColor:
                AppHelper.isDarkMode ? AppColors.darkerGrey : AppColors.light,
          ),
          title: Text(product.store.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductStoreTitleText(title: product.name, maxLines: 1),
              ProductStoreTitleText(
                title: product.description,
                maxLines: 1,
                smallSize: true,
              ),
            ],
          ),
        ),

        SizedBox(height: AppSizes.spaceBtwItems / 2),

        // Quantity & Price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 20),

            /// Add Remove Buttons
            ProductQuantityWithAddRemoveButton(),

            // Product Price
            ProductPriceText(price: product.price),
          ],
        ),
      ],
    );
  }
}
