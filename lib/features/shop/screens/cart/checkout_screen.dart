import 'package:flutter/material.dart';
import 'package:geniego/common/styles/spacing_styles.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/products/cart/cart_item.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:geniego/main_screen.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cartItems});

  final Map<Product, RxInt> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Items In Cart
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (_, index) => CartItem(
                    product: cartItems.keys.elementAt(index),
                    showAddRemoveButtons: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: AppSpacingStyles.paddingWithoutTop,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Billing Section
            RoundedContainer(
              padding: EdgeInsets.all(AppSizes.md),
              showBorder: true,
              backgroundColor: AppColors.darkLight,
              child: Column(
                children: [
                  // Pricing
                  BillingAmountSection(),

                  const SizedBox(height: AppSizes.spaceBtwItems),

                  const Divider(),

                  // Payment Methods
                  BillingPaymentSection(),

                  SizedBox(height: AppSizes.spaceBtwItems),

                  const Divider(),

                  // Address
                  BillingAddressSection(),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => AppDialogs.showSuccessDialog(
                  'Payment Success!',
                  'Your Item Will Be Shipped Soon!',
                  AppImages.successfulPaymentIcon,
                  () => Get.offAll(() => const MainScreen()),
                ),
                child: Text('Checkout \$256.0'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
