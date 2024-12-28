import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/products%20_details_%20image.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:geniego/features/shop/models/product.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Hero(tag: product.id, child: ProductImage(imageUrl: product.image)),

            // Product Details
            Padding(
              padding: EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating & Share Button
                  RatingAndShare(),

                  // Price
                  ProductPriceText(
                    price: '175',
                    isLarge: true,
                  ),

                  // Title
                  ProductStoreTitleText(title: product.name),

                  const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

                  // Stock Status
                  Row(
                    children: [
                      const ProductStoreTitleText(title: 'Status'),
                      const SizedBox(width: AppSizes.spaceBtwItems),
                      Text('In Stock',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),

                  const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

                  // Brand
                  Row(
                    children: [
                      AppCircularImage(
                        image: AppImages.appLogo,
                        width: 32,
                        height: 32,
                        overlayColor: AppHelper.isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                      ),

                      const SizedBox(width: AppSizes.sm),

                      // Store Name
                      ProductStoreTitleText(title: 'Nike'),
                    ],
                  ),

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
      bottomNavigationBar: BottomAddToCart(),
    );
  }
}
