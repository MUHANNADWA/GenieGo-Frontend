import 'package:flutter/material.dart';
import 'package:geniego/common/styles/spacing_styles.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/features/owner/controllers/product/dashboard_product_controller.dart';
import 'package:geniego/features/owner/screens/product/edit_product_screen.dart';
import 'package:geniego/features/shop/controllers/search/search_controller.dart';
import 'package:geniego/features/shop/screens/product/widgets/bottom_add_to_cart.dart';
import 'package:geniego/features/shop/screens/product/widgets/product_details_image.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardProductController());
    final searchController = Get.put(AppSearchController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Hero(
                tag: 'Product ${product.id}',
                child: ProductImage(image: product.image, id: product.id)),

            // Product Details
            Padding(
              padding: AppSpacingStyles.paddingWithoutTop,
              child: Column(
                children: [
                  // Title
                  TitleText(title: product.name, bigSize: true),

                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // Price
                  PriceText(price: product.price, isLarge: true),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Stock Status
                  Row(
                    children: [
                      const TitleText(title: 'Status'),
                      const SizedBox(width: AppSizes.spaceBtwItems),
                      Text('In Stock ${product.stock}',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),

                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // Brand
                  // StoreIconWithName(store: product.store),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Attributes
                  RoundedContainer(
                    padding: EdgeInsets.all(AppSizes.md),
                    backgroundColor: AppHelper.isDarkMode
                        ? AppColors.darkerGrey
                        : AppColors.grey,
                    child: Column(
                      children: [
                        // Description
                        const SectionHeading(title: 'Description'),

                        const SizedBox(height: AppSizes.spaceBtwItems),

                        ReadMoreText(
                          product.description,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show More',
                          trimExpandedText: ' Less',
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Tags
                  if (product.tags.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(title: 'Tags'),

                        SizedBox(height: AppSizes.spaceBtwItems),

                        // Tags
                        Wrap(
                          spacing: AppSizes.sm,
                          runSpacing: AppSizes.sm,
                          children: List.generate(
                            product.tags.length,
                            (index) => GestureDetector(
                              onTap: () => searchController.search(
                                '',
                                [product.tags.elementAt(index)['name']],
                              ),
                              child: RoundedContainer(
                                padding: EdgeInsets.all(AppSizes.sm),
                                backgroundColor: AppColors.darkerGrey,
                                child: Text(product.tags[index]['name']),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  if (AuthService.currentUser.role == 'Owner' &&
                      AuthService.currentUser.storeId == product.storeId)
                    Column(
                      children: [
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        // Edit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Get.to(
                                () => EditProductScreen(product: product)),
                            child: Text('Edit Product'),
                          ),
                        ),

                        const SizedBox(height: AppSizes.spaceBtwItems),

                        // Delete Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () =>
                                controller.deleteProduct(product.id),
                            child: Text('Delete Product'),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AuthService.currentUser.role != 'Owner'
          ? BottomAddToCart(product: product)
          : null,
    );
  }
}
