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
import 'package:geniego/features/shop/models/store.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
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
            // Product Image
            Hero(
                tag: store.id,
                child: ProductImage(
                  imageUrl: store.image,
                )),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating & Share Button
                  const RatingAndShare(),

                  // Title
                  ProductStoreTitleText(title: store.name),

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
                      const ProductStoreTitleText(title: 'Nike'),
                    ],
                  ),

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
          ],
        ),
      ),
    );
  }
}
