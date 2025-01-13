import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/styles/spacing_styles.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/features/owner/controllers/store/dashboard_store_controller.dart';
import 'package:geniego/features/owner/screens/store/edit_store_screen.dart';
import 'package:geniego/features/shop/screens/product/widgets/product_details_image.dart';
import 'package:geniego/features/shop/controllers/stores/store_products_controller.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
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
    final dashController = Get.put(DashboardStoreController());
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
              padding: AppSpacingStyles.paddingWithoutTop,
              child: Column(
                children: [
                  // Title
                  TitleText(title: store.name, bigSize: true),

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

                  if (AuthService.currentUser.role == 'Owner' &&
                      AuthService.currentUser.storeId == store.id)
                    Column(
                      children: [
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        // Edit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () =>
                                Get.to(() => EditStoreScreen(store: store)),
                            child: Text('Edit Store'),
                          ),
                        ),

                        const SizedBox(height: AppSizes.spaceBtwItems),

                        // Delete Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () =>
                                dashController.deleteStore(store.id),
                            child: Text('Delete Store'),
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                  // Store Products
                  RefreshIndicator(
                    onRefresh: () =>
                        controller.refreshStoreProductsByStoreId(store.id),
                    child: Obx(
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
                                  title: 'Oops! Something Went Wrong',
                                  subTitle:
                                      'We encountered an error while fetching this product from this Store.')
                              : controller.storeProducts.value.isEmpty
                                  ? AppDefaultPage(
                                      image: AppImages.disconnected,
                                      title:
                                          'There are no products in this store',
                                      subTitle:
                                          'It looks like there are no products in this store yet.')
                                  : GridLayout(
                                      itemCount: controller.storeProducts
                                              .value[store.id]?.length ??
                                          0,
                                      itemBuilder: (_, index) => ProductCard(
                                        product: controller.storeProducts
                                            .value[store.id]![index],
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
