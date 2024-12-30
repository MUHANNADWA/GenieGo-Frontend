import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/products/cart/add_remove_button.dart';
import 'package:geniego/common/widgets/products/cart/cart_item.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                /// Cart Item
                CartItem(
                  product: AppHelper.exampleProduct,
                ),
                if (showAddRemoveButtons)
                  SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),

                /// Add Remove Button Row With Total Price
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          /// Extra Space
                          const SizedBox(
                            width: 70,
                          ),
                        ],
                      ),

                      /// Add Remove Buttons

                      ProductQuantityWithAddRemoveButton(),
                      ProductPriceText(price: '256'),
                    ],
                  ),
              ],
            ),
        separatorBuilder: (_, __) => const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
        itemCount: 2);
  }
}
