import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/owner/screens/product/add_product_screen.dart';
import 'package:geniego/features/owner/screens/store/add_store_screen.dart';
import 'package:geniego/features/owner/controllers/dashboard/dashboard_controller.dart';
import 'package:geniego/features/owner/screens/product/dashboard_products_screen.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_details_screen.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      appBar: AppAppBar(
          title: Text(AppTexts.dashboard,
              style: Theme.of(context).textTheme.headlineMedium)),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchDashboardItems(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                // Heading
                Obx(
                  () => controller.isLoading.value
                      ? AppShimmer(
                          child: GridLayout(
                            itemCount: 4,
                            itemBuilder: (_, __) => RoundedContainer(
                                height: 282, backgroundColor: Colors.black),
                          ),
                        )
                      : controller.hasError.value
                          ? AppDefaultPage(
                              image: AppImages.disconnected,
                              title: 'Oops! Something Went Wrong ',
                              subTitle:
                                  'We encountered an error while fetching Your Dashboard data.')
                          : controller.products.value.isEmpty &&
                                  controller.store == null
                              ? AppDefaultPage(
                                  image: AppImages.forbidden,
                                  title: 'No Store Found',
                                  subTitle:
                                      'It looks like you do not have a store yet, Click the button below to add you first!')
                              : Column(
                                  children: [
                                    // Stores
                                    if (controller.store != null)
                                      Column(
                                        children: [
                                          SectionHeading(
                                            title: 'My Store',
                                            onPressed: () => Get.to(() =>
                                                StoreDetailsScreen(
                                                    store: controller.store!)),
                                            showActionButton: true,
                                            buttonTitle: 'View Details',
                                          ),
                                          SizedBox(
                                              height: AppSizes.defaultSpace),
                                          StoreCard(store: controller.store!),
                                          SizedBox(
                                              height: AppSizes.defaultSpace),
                                        ],
                                      ),

                                    // Products
                                    if (controller.products.value.isNotEmpty)
                                      Column(
                                        children: [
                                          SectionHeading(
                                            title: 'My Products',
                                            showActionButton: true,
                                            onPressed: () => Get.to(
                                                () => OwnerProductsScreen()),
                                          ),
                                          SizedBox(
                                              height: AppSizes.defaultSpace),
                                          GridLayout(
                                            itemCount: min(
                                                controller
                                                    .products.value.length,
                                                4),
                                            itemBuilder: (_, index) =>
                                                ProductCard(
                                                    product: controller
                                                        .products.value[index]),
                                          ),
                                        ],
                                      ),

                                    if (controller.products.value.isEmpty)
                                      Column(
                                        children: [
                                          SectionHeading(
                                            title: 'My Products',
                                            showActionButton: true,
                                            onPressed: () => Get.to(
                                                () => OwnerProductsScreen()),
                                          ),
                                          AppDefaultPage(
                                            image: AppImages.forbidden,
                                            title: 'No Products Found',
                                            subTitle:
                                                'It looks like you have not added products for your store yet',
                                            fullScreen: false,
                                            showActionButton: true,
                                            actionButtonText:
                                                'Add your first product',
                                            onPressedActionButton: () => Get.to(
                                                () => AddProductScreen()),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: controller.store == null
          ? ElevatedButton(
              onPressed: () => Get.to(() => AddStoreScreen()), child: Text('+'))
          : null,
    );
  }
}
