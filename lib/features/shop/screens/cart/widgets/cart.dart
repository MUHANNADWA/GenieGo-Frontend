import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/products/cart/add_remove_button.dart';
import 'package:geniego/common/widgets/products/cart/cart_item.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/features/authentication/screens/shop/screens/checkout/widgets/checkout.dart';
import 'package:geniego/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),

        /// -- Items In Cart
        child: CartItems(),
      ),

      /// Checkout Button
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
