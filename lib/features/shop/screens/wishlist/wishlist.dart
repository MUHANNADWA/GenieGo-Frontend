import 'dart:math';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/icons/app_circular_icons.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/utils/constants/colors.dart';
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
    return Scaffold(
      appBar: AppAppBar(
        title: Text(
          AppTexts.wishlist,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.toNamed(homeScreen),
          ),
        ],
      ),
      body: CustomMaterialIndicator(
        onRefresh: () => Future.delayed(Duration(seconds: 5)),
        backgroundColor: AppColors.light,
        indicatorBuilder: (context, controller) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircularProgressIndicator(
              color: AppColors.darkLight,
              value: controller.state.isLoading
                  ? null
                  : min(controller.value, 1.0),
            ),
          );
        },
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  GridLayout(
                    itemCount: 12,
                    itemBuilder: (_, index) =>
                        ProductCard(product: AppHelper.exampleProduct),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
