import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/icons/app_circular_icons.dart';
import 'package:geniego/features/shop/controllers/wishlist/wishlist_controller.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishlistController());

    return Obx(
      () => CircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? AppColors.error : null,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
