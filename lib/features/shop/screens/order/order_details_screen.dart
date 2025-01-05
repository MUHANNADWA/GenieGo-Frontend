import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/products/cart/cart_item.dart';
import 'package:geniego/features/shop/models/order_model.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          'Order Details',
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
                  itemCount: order.products.length,
                  itemBuilder: (_, index) => CartItem(
                    product: order.products.elementAt(index),
                    showAddRemoveButtons: false,
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

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
            ],
          ),
        ),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
      ),
    );
  }
}
