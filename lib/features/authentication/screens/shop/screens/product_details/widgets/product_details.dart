import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/custom_shapes/curved_edges/curved_edge.dart';
import 'package:geniego/common/widgets/icons/app_circular_icons.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/products%20_details_%20image_slider.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ProductImageSlider(),

            /// Product Details
            Padding(
                padding: EdgeInsets.only(
                  right: AppSizes.defaultSpace,
                  left: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// - Rating & Share Button
                    RatingAndShare(),

                    /// - Price,Title,Stock, & Brand
                    ProductMetaData(),

                    /// - Title
                    ProductStoreTitleText(title: 'Green Nike Sports Shirt'),
                    const SizedBox(
                      height: AppSizes.spaceBtwItems / 1.5,
                    ),

                    /// Stock Status
                    Row(
                      children: [
                        const ProductStoreTitleText(title: 'Status'),
                        const SizedBox(
                          width: AppSizes.spaceBtwItems,
                        ),
                        Text('In Stock',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),

                    const SizedBox(
                      height: AppSizes.spaceBtwItems / 1.5,
                    ),

                    /// Brand

                    Row(
                      children: [
                        AppCircularImage(
                          image: AppImages.shoeIcon,
                          width: 32,
                          height: 32,
                          overlayColor:
                              dark ? AppColors.white : AppColors.black,
                        ),
                        Text('Nike'),
                      ],
                    ),

                    /// -- Attributes
                    /// -- Checkout Button
                    /// - Description
                    /// - Reviews
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
