import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_details_screen.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerticalStoreCard extends StatelessWidget {
  const VerticalStoreCard({
    super.key,
    required this.store,
    this.textColor = AppColors.white,
    this.backgrongdColor,
    this.onTap,
  });

  final Store store;
  final Color? textColor, backgrongdColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => StoreDetailsScreen(store: store)),
      child: Hero(
        tag: 'Store ${store.id}',
        child: Column(
          children: [
            // Store Image
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceBtwItems),
              padding: const EdgeInsets.all(AppSizes.sm),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: backgrongdColor ?? (AppColors.darkLight),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AppHelper.isNetworkImage(store.image)
                      ? CachedNetworkImageProvider(store.image)
                      : AssetImage(store.image) as ImageProvider,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : CircularProgressIndicator(),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: AppSizes.sm),

            // Store Name
            SizedBox(
              width: 60,
              child: Center(
                child: Text(
                  store.name,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
