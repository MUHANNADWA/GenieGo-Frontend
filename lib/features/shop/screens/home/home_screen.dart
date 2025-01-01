import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/controllers/products/products_controller.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_popular_stores.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Search Bar
                  AppSearchBar(searchText: AppTexts.searchProducts),

                  const SizedBox(height: AppSizes.spaceBtwSections * 2),

                  // Popular Stores
                  const HomePopularStores(),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Heading
                  SectionHeading(title: AppTexts.popularProducts),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Products
                  CustomMaterialIndicator(
                    onRefresh: () => controller.refreshProducts(),
                    child: Obx(
                      () => controller.isLoading.value
                          ? AppShimmer(
                              child: GridLayout(
                                itemCount: 4,
                                itemBuilder: (_, index) =>
                                    RoundedContainer(height: 282),
                              ),
                            )
                          : controller.hasError.value
                              ? Text(controller.errorMessage.value)
                              : controller.products.value.isEmpty
                                  ? Text('Empty')
                                  : GridLayout(
                                      itemCount:
                                          controller.products.value.length,
                                      itemBuilder: (_, index) => ProductCard(
                                          product:
                                              controller.products.value[index]),
                                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
