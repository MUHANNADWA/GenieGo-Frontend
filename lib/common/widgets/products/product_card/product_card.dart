import 'package:flutter/material.dart';
import 'package:geniego/common/styles/shadows.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_rounded_image.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/products/product_card/favourite_button.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/product_details_screen.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [AppShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: AppHelper.isDarkMode ? AppColors.darkerGrey : AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Thumbnail, Wishlist Button, Discount Tag
            RoundedContainer(
              height: 178,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: AppColors.darkLight,
              child: Stack(
                children: [
                  // Thumbnail Image
                  Hero(
                    tag: 'Product ${product.id}',
                    child: RoundedImage(
                      width: double.infinity,
                      height: double.infinity,
                      image: product.image,
                      backgroundColor: AppHelper.isDarkMode
                          ? AppColors.dark
                          : AppColors.light,
                    ),
                  ),

                  // Favourite Icon Button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: FavouriteButton(productId: product.id),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: AppHelper.isRtl
                  ? const EdgeInsets.only(right: AppSizes.sm)
                  : const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  ProductStoreTitleText(title: product.name, smallSize: true),

                  const SizedBox(height: AppSizes.spaceBtwItems / 2),

                  // Brand
                  // StoreIconWithName(store: product.storeId.toString()),

                  // Price & Add To Cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      ProductPriceText(price: product.price),

                      // Add To Cart Button
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: AppHelper.isRtl
                              ? BorderRadius.only(
                                  topRight:
                                      Radius.circular(AppSizes.cardRadiusMd),
                                  bottomLeft: Radius.circular(
                                    AppSizes.productImageRadius,
                                  ),
                                )
                              : BorderRadius.only(
                                  topLeft:
                                      Radius.circular(AppSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(
                                    AppSizes.productImageRadius,
                                  ),
                                ),
                        ),
                        child: const SizedBox(
                          width: AppSizes.iconLg * 1.2,
                          height: AppSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
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
