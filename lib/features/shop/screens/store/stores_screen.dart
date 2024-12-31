import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/controllers/stores/stores_controller.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
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
              showBackground: false,
              showBorder: true,
            ),

            SizedBox(height: AppSizes.spaceBtwItems),

            // Stores
            CustomMaterialIndicator(
              onRefresh: () => controller.refreshStores(),
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return AppShimmer(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.defaultSpace),
                        child: GridLayout(
                          crossAxisCount: 1,
                          mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (_, __) => RoundedContainer(height: 80),
                        ),
                      ),
                    );
                  } else if (controller.hasError.value) {
                    return AppShimmer(
                        child: Text(controller.errorMessage.value));
                  } else {
                    final stores = controller.stores.value;
                    return Padding(
                      padding: const EdgeInsets.all(AppSizes.defaultSpace),
                      child: GridLayout(
                        crossAxisCount: 1,
                        mainAxisExtent: 80,
                        itemCount: stores.length,
                        itemBuilder: (_, index) =>
                            StoreCard(store: stores[index]),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
