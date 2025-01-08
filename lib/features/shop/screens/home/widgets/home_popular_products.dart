import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/controllers/products/products_controller.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class HomePopularProducts extends StatelessWidget {
  const HomePopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());

    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          // Heading
          SectionHeading(title: AppTexts.popularProducts),

          const SizedBox(height: AppSizes.spaceBtwSections),

          // Products
          RefreshIndicator(
            onRefresh: () => controller.refreshProducts(),
            child: Obx(
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
                      : controller.products.value.isEmpty
                          ? AppDefaultPage(
                              image: AppImages.disconnected,
                              title: 'There Are No Products',
                              subTitle:
                                  'It looks like you haven’t added any Products yet.')
                          : GridLayout(
                              itemCount: controller.products.value.length,
                              itemBuilder: (_, index) => ProductCard(
                                  product: controller.products.value[index]),
                            ),
            ),
          ),
        ],
      ),
    );
  }
}
