import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/icons/app_circular_icons.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/controllers/wishlist/favourites_controller.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Scaffold(
      appBar: AppAppBar(
          title: Text(AppTexts.wishlist,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CircularIcon(
                icon: Iconsax.add, onPressed: () => Get.toNamed(homeScreen))
          ]),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: CustomMaterialIndicator(
            onRefresh: () => controller.refreshFavourites(),
            child: Obx(
              () => controller.isLoading.value
                  ? AppShimmer(
                      child: GridLayout(
                        itemCount: 4,
                        itemBuilder: (_, __) => RoundedContainer(height: 282),
                      ),
                    )
                  : controller.hasError.value
                      ? GridLayout(
                          itemCount: 4,
                          itemBuilder: (_, __) =>
                              ProductCard(product: AppHelper.exampleProduct))
                      : controller.favourites.value.isEmpty
                          ? Text('Empty')
                          : GridLayout(
                              itemCount: controller.favourites.value.length,
                              itemBuilder: (_, index) => ProductCard(
                                  product: controller.favourites.value[index]),
                            ),
            ),
          ),
        ),
      ),
    );
  }
}
