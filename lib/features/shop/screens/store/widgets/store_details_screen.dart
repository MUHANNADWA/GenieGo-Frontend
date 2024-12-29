import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/products%20_details_%20image.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class StoreDetailsScreen extends StatelessWidget {
  final Store store;
  const StoreDetailsScreen({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Store Image
            Hero(
                tag: 'Store ${store.id}',
                child: ProductImage(imageUrl: store.image, height: 200)),

            // Store Details
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Title
                  ProductStoreTitleText(title: store.name, bigSize: true),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Attributes
                  RoundedContainer(
                    padding: const EdgeInsets.all(AppSizes.md),
                    backgroundColor: AppHelper.isDarkMode
                        ? AppColors.darkerGrey
                        : AppColors.grey,
                    child: Column(
                      children: [
                        // Description
                        const SectionHeading(title: 'Description'),

                        const SizedBox(height: AppSizes.spaceBtwItems),

                        ReadMoreText(
                          store.description,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show More',
                          trimExpandedText: ' Less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            // Products
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: FutureBuilder(
                  future: ShopService.getStoreProductsByStoreId(store.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show shimmer loading
                      return AppShimmer(
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

                          return ProductCard(product: product);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return GridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          final Product product = AppHelper.exampleProduct;

                          return ProductCard(product: product);
                        },
                      );
                      // Show error message
                      // return Center(
                      //   child: Text('Error: ${snapshot.error}'),
                      // );
                    } else {
                      // Fallback UI
                      return const SizedBox.shrink();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
