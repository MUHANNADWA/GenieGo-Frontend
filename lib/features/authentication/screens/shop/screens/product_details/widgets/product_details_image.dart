import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/curved_edges/curved_edge.dart';
import 'package:geniego/common/widgets/products/product_card/favourite_button.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrl, this.height = 400});

  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CurvedEdges(
      child: Container(
        color: AppHelper.isDarkMode ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            // Main Large Image
            SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: imageUrl == AppImages.appLogo
                        ? AssetImage(imageUrl) as ImageProvider
                        : NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),

            // Appbar Icons
            AppAppBar(
              showBackArrow: true,
              actions: [FavouriteButton()],
            ),
          ],
        ),
      ),
    );
  }
}
