// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_Cards/product_card_vertical.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_popular_stores.dart';
import 'package:geniego/utils/constants/text_strings.dart';

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
                  AppSearchBar(
                    searchText: AppTexts.searchStore,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),

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

                  // Popular Products
                  GridLayout(
                    itemCount: 10,
                    itemBuilder: (_, index) => const ProductCardVertical(),
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
