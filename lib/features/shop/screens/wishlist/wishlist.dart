import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/icons/app_circular_icons.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_Cards/Product_Card_Vertical.dart';
import 'package:geniego/features/shop/screens/home/home_screen.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => ProductCardVertical(),
                ),
              ],
            )),
      ),
    );
  }
}
