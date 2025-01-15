import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/styles/spacing_styles.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/products/cart/cart_item.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/screens/cart/checkout_screen.dart';
import 'package:geniego/features/shop/controllers/cart/cart_controller.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.fetchCartProducts();

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(AppTexts.cart,
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchCartProducts(),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Obx(
            () => ListView.separated(
              shrinkWrap: true,
              itemCount: controller.cartItems.value.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: AppSizes.spaceBtwItems),
              itemBuilder: (_, index) => controller.isLoading.value
                  ? AppShimmer(
                      child: CartItem(product: AppHelper.exampleProduct))
                  : controller.hasError.value
                      ? AppDefaultPage(
                          image: AppImages.disconnected,
                          title: 'Oops! Something Went Wrong',
                          subTitle:
                              'We encountered an error while fetching the cart items.')
                      : controller.cartItems.value.isEmpty
                          ? AppDefaultPage(
                              image: AppImages.disconnected,
                              title: 'There Are No items in cart',
                              subTitle:
                                  'It looks like you haven’t added any items to the cart yet.')
                          : CartItem(
                              product: controller.cartProducts.keys
                                  .elementAt(index)),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppSpacingStyles.paddingWithoutTop,
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Clear
              OutlinedButton(
                onPressed: !controller.isLoading.value &&
                        controller.cartItems.value.isNotEmpty
                    ? () => controller.clearCart()
                    : null,
                child: Text('Clear Cart'),
              ),

              SizedBox(width: AppSizes.spaceBtwItems),

              // Checkout
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    side: WidgetStatePropertyAll(
                      BorderSide(color: Colors.transparent),
                    ),
                  ),
                  onPressed: !controller.isLoading.value &&
                          controller.cartItems.value.isNotEmpty
                      ? () => Get.to(() => CheckoutScreen(
                          cartItems: controller.cartProducts.value))
                      : null,
                  child: Text('Checkout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
