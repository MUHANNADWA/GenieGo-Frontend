import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/owner/owner_products_screen.dart';
import 'package:geniego/features/owner/owner_stores_screen.dart';
import 'package:geniego/features/shop/controllers/search/search_controller.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';

class OwnerDashboard extends StatelessWidget {
  final controller = Get.put(AppSearchController());
  OwnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: Text('Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Heading
              Obx(
                () => controller.isLoading.value
                    ? AppShimmer(
                        child: GridLayout(
                          itemCount: 4,
                          itemBuilder: (_, __) => RoundedContainer(height: 282),
                        ),
                      )
                    : controller.hasError.value
                        ? AppDefaultPage(
                            image: AppImages.disconnected,
                            title: 'Oops! Something Went Wrong ',
                            subTitle:
                                'We encountered an error while fetching the product details.')
                        : controller.products.value.isEmpty &&
                                controller.stores.value.isEmpty
                            ? AppDefaultPage(
                                image: AppImages.disconnected,
                                title: 'There Are No Products',
                                subTitle:
                                    'It looks like you haven’t added any Products yet.')
                            : Column(
                                children: [
                                  // Products
                                  if (controller.products.value.isNotEmpty)
                                    Column(
                                      children: [
                                        Divider(),
                                        SizedBox(height: AppSizes.sm),
                                        SectionHeading(
                                          title: 'Products',
                                          showActionButton: true,
                                          onPressed: () => Get.to(
                                              () => OwnerProductsScreen()),
                                        ),
                                        SizedBox(height: AppSizes.defaultSpace),
                                        GridLayout(
                                          itemCount:
                                              controller.products.value.length,
                                          itemBuilder: (_, index) =>
                                              ProductCard(
                                                  product: controller
                                                      .products.value[index]),
                                        ),
                                      ],
                                    ),

                                  SizedBox(height: AppSizes.spaceBtwSections),

                                  // Stores
                                  if (controller.stores.value.isNotEmpty)
                                    Column(
                                      children: [
                                        Divider(),
                                        SizedBox(height: AppSizes.sm),
                                        SectionHeading(
                                          title: 'Stores',
                                          onPressed: () =>
                                              Get.to(() => OwnerStoresScreen()),
                                          showActionButton: true,
                                        ),
                                        SizedBox(height: AppSizes.defaultSpace),
                                        GridLayout(
                                          crossAxisCount: 1,
                                          mainAxisExtent: 80,
                                          itemCount:
                                              controller.stores.value.length,
                                          itemBuilder: (_, index) => StoreCard(
                                              store: controller
                                                  .stores.value[index]),
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
    );
  }
}
