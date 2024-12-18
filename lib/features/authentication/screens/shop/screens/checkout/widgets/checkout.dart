import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/products/cart/coupon_widget.dart';
import 'package:geniego/features/authentication/screens/signup/success_screen.dart';
import 'package:geniego/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:geniego/navigation_menu.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode;
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
              /// -- Items In Cart
              const CartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// -- Coupon TextField
              CouponCode(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// -- Billing Section
              RoundedContainer(
                padding: EdgeInsets.all(AppSizes.md),
                showBorder: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    BillingAmountSection(),
                    const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),

                    /// Divider
                    const Divider(),
                    const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),

                    /// Payment Methods
                    BillingPaymentSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),

                    /// Address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: AppImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subTitle: 'Your Item Will Be Shipped Soon!',
              onPressed: () => Get.offAll(
                () => const NavigationMenu(),
              ),
            ),
          ),
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
