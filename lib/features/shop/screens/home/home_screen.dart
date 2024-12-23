// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_Cards/product_card_vertical.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/models/product.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_popular_stores.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Search Bar
                  AppSearchBar(searchText: AppTexts.searchStore),

                  const SizedBox(height: AppSizes.spaceBtwSections * 2),

                  // Popular Stores
                  const HomePopularStores(),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Heading
                  SectionHeading(title: 'Popular Products'),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Stores
                  FutureBuilder(
                      future: ShopService.getProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Show shimmer loading
                          return Shimmer.fromColors(
                            period: Duration(seconds: 2),
                            baseColor: AppHelper.isDarkMode
                                ? AppColors.dark
                                : AppColors.light,
                            highlightColor: AppHelper.isDarkMode
                                ? AppColors.darkerGrey
                                : AppColors.darkGrey,
                            child: GridLayout(
                              itemCount: 4,
                              itemBuilder: (_, index) =>
                                  RoundedContainer(height: 282),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          // Show the actual data
                          final dynamic products = snapshot.data!;

                          return GridLayout(
                              itemCount: (products['data'] as List).length,
                              itemBuilder: (_, index) {
                                final Product product =
                                    Product.fromJson(products['data'][index]);

                                return ProductCardVertical(product: product);
                              });
                        } else if (snapshot.hasError) {
                          // Show error message
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          // Fallback UI
                          return const SizedBox.shrink();
                        }
                      }),

                  // Popular Products
                  // GridLayout(
                  //   itemCount: 12,
                  //   itemBuilder: (_, index) => const ProductCardVertical(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
