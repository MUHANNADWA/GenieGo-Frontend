import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/controllers/stores/stores_controller.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoresController());

    return Scaffold(
      appBar: AppAppBar(
        title: Text(
          AppTexts.stores,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [CartCounterIcon()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSizes.spaceBtwItems),

            AppSearchBar(
              searchText: AppTexts.searchStores,
              showBorder: true,
            ),

            SizedBox(height: AppSizes.spaceBtwItems),

            // Stores
            RefreshIndicator(
              onRefresh: () => controller.refreshStores(),
              child: Obx(
                () => controller.isLoading.value
                    ? AppShimmer(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.defaultSpace),
                          child: GridLayout(
                            crossAxisCount: 1,
                            mainAxisExtent: 80,
                            itemCount: 4,
                            itemBuilder: (_, __) =>
                                RoundedContainer(height: 80),
                          ),
                        ),
                      )
                    : controller.hasError.value
                        ? AppDefaultPage(
                            image: AppImages.disconnected,
                            title: 'Oops! Something Went Wrong',
                            subTitle:
                                'We encountered an error while fetching the Store details.')
                        : controller.stores.value.isEmpty
                            ? AppDefaultPage(
                                image: AppImages.disconnected,
                                title: 'There are no stores',
                                subTitle:
                                    'It looks like there are no stores yet.')
                            : Padding(
                                padding:
                                    const EdgeInsets.all(AppSizes.defaultSpace),
                                child: GridLayout(
                                  crossAxisCount: 1,
                                  mainAxisExtent: 80,
                                  itemCount: controller.stores.value.length,
                                  itemBuilder: (_, index) => StoreCard(
                                      store: controller.stores.value[index]),
                                ),
                              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
