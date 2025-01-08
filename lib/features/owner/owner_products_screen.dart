import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/owner/add_product_screen.dart';
import 'package:geniego/features/shop/controllers/search/search_controller.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class OwnerProductsScreen extends StatelessWidget {
  const OwnerProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppSearchController());

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text('My Products'),
      ),
      body: Obx(
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
                                TitleText(title: 'Products'),
                                SizedBox(height: AppSizes.defaultSpace),
                                GridLayout(
                                  itemCount: controller.products.value.length,
                                  itemBuilder: (_, index) => ProductCard(
                                      product:
                                          controller.products.value[index]),
                                ),
                              ],
                            ),

                          SizedBox(height: AppSizes.spaceBtwSections),
                        ],
                      ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () => Get.to(() => AddProductScreen()), child: Text('+')),
    );
  }
}
