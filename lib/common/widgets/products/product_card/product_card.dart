import 'package:flutter/material.dart';
import 'package:geniego/common/styles/shadows.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_rounded_image.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/icons/app_circular_icons.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/authentication/screens/shop/screens/product_details/widgets/product_details.dart';
import 'package:geniego/features/shop/models/product.dart';
import 'package:geniego/features/shop/models/store.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
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
              height: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor:
                  AppHelper.isDarkMode ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  Hero(
                    tag: product.id,
                    child: RoundedImage(
                      width: double.infinity,
                      height: double.infinity,
                      isNetworkImage: product.image != AppImages.appLogo,
                      imageUrl: product.image,
                      backgroundColor: AppHelper.isDarkMode
                          ? AppColors.dark
                          : AppColors.light,
                    ),
                  ),

                  // Favourite Icon Button
                  FavouriteButton(),
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
                  ProductStoreTitleText(
                    title: product.name,
                    smallSize: true,
                  ),

                  const SizedBox(height: AppSizes.spaceBtwItems / 2),

                  // Brand
                  FutureBuilder(
                      future: ShopService.getStoreById(product.storeId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // Show the actual data
                          dynamic store = snapshot.data!;
                          store = store['data'];
                          return StoreIconWithName(
                              store: Store.fromJson(store));
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          // Fallback UI
                          return const SizedBox.shrink();
                        }
                      }),

                  // Price & Add To Cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      ProductPriceText(
                        price: product.price.toString(),
                      ),

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
                            child: Icon(
                              Iconsax.add,
                              color: AppColors.white,
                            ),
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

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      right: 0,
      child: CircularIcon(
        icon: Iconsax.heart5,
        color: AppColors.error,
      ),
    );
  }
}

class StoreIconWithName extends StatelessWidget {
  const StoreIconWithName({
    super.key,
    required this.store,
  });

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCircularImage(
          image: store.image,
          isNetworkImage: true,
          width: 32,
          height: 32,
          overlayColor:
              AppHelper.isDarkMode ? AppColors.white : AppColors.black,
          boxFit: BoxFit.contain,
        ),

        const SizedBox(width: AppSizes.sm),

        // Store Name
        ProductStoreTitleText(
          title: store.name,
          smallSize: true,
        ),
      ],
    );
  }
}
