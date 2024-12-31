import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/product_details_image.dart';
import 'package:geniego/features/shop/controllers/stores/stores_controller.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class StoreDetailsScreen extends StatelessWidget {
  final Store store;
  const StoreDetailsScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoresController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Store Image
            Hero(
                tag: 'Store ${store.id}',
                child: ProductImage(image: store.image, height: 200)),

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
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return AppShimmer(
                          child: GridLayout(
                            itemCount: 4,
                            itemBuilder: (_, __) =>
                                RoundedContainer(height: 282),
                          ),
                        );
                      } else if (controller.hasError.value) {
                        return GridLayout(
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return ProductCard(
                                product: AppHelper.exampleProduct);
                          },
                        );
                      } else {
                        final storeProducts = controller.storeProducts;

                        return GridLayout(
                          itemCount: storeProducts.length,
                          itemBuilder: (_, index) => ProductCard(
                              product: storeProducts[store.id]!.value[index]),
                        );
                      }
                      // else {
                      //   return const SizedBox.shrink();
                      // }
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
