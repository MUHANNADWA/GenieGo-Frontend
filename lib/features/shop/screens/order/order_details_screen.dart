import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/products/cart/cart_item.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/controllers/orders/order_products_controller.dart';
import 'package:geniego/features/shop/models/order_model.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:geniego/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderItemsController());
    controller.getOrderItemsByOrderId(order.id);

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          'Order Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchOrderItemsByOrderId(order.id),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Items In Cart
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.orderItems.value.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: AppSizes.spaceBtwItems),
                    itemBuilder: (_, index) => controller.isLoading.value
                        ? AppShimmer(
                            child: CartItem(
                            product: AppHelper.exampleProduct,
                            showAddRemoveButtons: false,
                          ))
                        : controller.hasError.value
                            ? AppDefaultPage(
                                image: AppImages.disconnected,
                                title: 'Oops! Something Went Wrong',
                                subTitle:
                                    'We encountered an error while fetching the cart items.')
                            : controller.orderItems.value.isEmpty
                                ? AppDefaultPage(
                                    image: AppImages.disconnected,
                                    title: 'There Are No items in cart',
                                    subTitle:
                                        'It looks like you haven’t added any items to the cart yet.')
                                : CartItem(
                                    product: controller
                                        .orderItems.value[order.id]!.keys
                                        .elementAt(index),
                                    showAddRemoveButtons: false,
                                  ),
                  ),
                ),

                // SizedBox(
                //   height: 300,
                //   child: ListView.builder(
                //     itemCount: order.products.length,
                //     itemBuilder: (_, index) => CartItem(
                //       product: order.products.elementAt(index),
                //       showAddRemoveButtons: false,
                //     ),
                //   ),
                // ),

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
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
      ),
    );
  }
}
