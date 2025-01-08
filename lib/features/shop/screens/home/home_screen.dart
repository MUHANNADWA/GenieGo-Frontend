import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:geniego/features/shop/screens/home/widgets/home_popular_products.dart';
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
                  AppSearchBar(searchText: AppTexts.searchProducts),

                  const SizedBox(height: AppSizes.spaceBtwSections * 2),

                  // Popular Stores
                  const HomePopularStores(),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            // Products
            HomePopularProducts(),
          ],
        ),
      ),
    );
  }
}
