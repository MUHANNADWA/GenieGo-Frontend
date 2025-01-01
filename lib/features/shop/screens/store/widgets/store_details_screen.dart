import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/product_details_image.dart';
import 'package:geniego/features/shop/controllers/stores/store_products_controller.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreProductsController(), permanent: true);
    controller.getStoreProductsByStoreId(store.id);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Store Image
            Hero(
                tag: 'Store ${store.id}',
                child: ProductImage(
                  image: store.image,
                  height: 200,
                  id: store.id,
                  showFavourite: false,
                )),

            // Store Details
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Title
                  ProductStoreTitleText(title: store.name, bigSize: true),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Attributes
                  RoundedContainer(
                    padding: const EdgeInsets.all(AppSizes.md),
                    backgroundColor: AppHelper.isDarkMode
                        ? AppColors.darkerGrey
                        : AppColors.grey,
                    child: Column(
                      children: [
                        // Description
                        const SectionHeading(title: 'Description'),

                        const SizedBox(height: AppSizes.spaceBtwItems),

                        ReadMoreText(
                          store.description,
                          trimMode: TrimMode.Line,
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Store Products
                  CustomMaterialIndicator(
                    onRefresh: () =>
                        controller.refreshStoreProductsByStoreId(store.id),
                    child: Obx(
                      () => controller.isLoading.value
                          ? AppShimmer(
                              child: GridLayout(
                                itemCount: 4,
                                itemBuilder: (_, __) =>
                                    RoundedContainer(height: 282),
                              ),
                            )
                          : controller.hasError.value
                              ? GridLayout(
                                  itemCount: 4,
                                  itemBuilder: (_, index) => ProductCard(
                                      product: AppHelper.exampleProduct),
                                )
                              : GridLayout(
                                  itemCount: controller
                                      .storeProducts.value[store.id]!.length,
                                  itemBuilder: (_, index) => ProductCard(
                                    product: controller
                                        .storeProducts.value[store.id]![index],
                                  ),
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
