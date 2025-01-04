import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_details_screen.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => StoreDetailsScreen(store: store)),
      child: RoundedContainer(
        padding: EdgeInsets.all(AppSizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Store Icon
            Hero(
              tag: 'Store ${store.id}',
              child: AppCircularImage(
                backgroundColor: Colors.transparent,
                image: store.image,
                overlayColor: AppColors.darkLightInvert,
                boxFit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: AppSizes.spaceBtwItems / 2),

            // Title & Sub Title
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    title: store.name,
                    maxLines: 1,
                  ),

                  SizedBox(height: AppSizes.xs),

                  // Sub Title
                  Text(
                    store.description,
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
