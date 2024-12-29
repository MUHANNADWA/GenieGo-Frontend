import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/products/cart/add_remove_button.dart';
import 'package:geniego/common/widgets/products/cart/cart_item.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/features/authentication/screens/shop/screens/checkout/widgets/checkout.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          AppTexts.cart,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) => Column(
                  children: [
                    // Item
                    CartItem(
                      product: AppHelper.exampleProduct,
                    ),

                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Extra Space
                            const SizedBox(
                              width: 70,
                            ),
                          ],
                        ),

                        /// Add Remove Buttons
                        ProductQuantityWithAddRemoveButton(),

                        // Product Price
                        ProductPriceText(price: '256'),
                      ],
                    ),
                  ],
                ),
            separatorBuilder: (_, __) => const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
            itemCount: 10),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
