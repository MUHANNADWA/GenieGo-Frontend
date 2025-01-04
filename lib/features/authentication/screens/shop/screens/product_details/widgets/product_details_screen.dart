import 'package:flutter/material.dart';
import 'package:geniego/common/styles/spacing_styles.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/product_details_image.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
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

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Checkout'),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(product: product),
    );
  }
}
