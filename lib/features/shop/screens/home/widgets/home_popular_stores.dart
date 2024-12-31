import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/image_text_widgets/vertical_store_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/controllers/stores/stores_controller.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class HomePopularStores extends StatelessWidget {
  const HomePopularStores({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoresController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          // Popular Stores Heading
          SectionHeading(
              title: AppTexts.popularStores, textColor: AppColors.lightGrey),

          const SizedBox(height: AppSizes.spaceBtwItems),

          // Popular Stores List
          CustomMaterialIndicator(
            onRefresh: () => controller.refreshStores(),
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      if (controller.isLoading.value) {
                        return AppShimmer(
                          child:
                              VerticalStoreCard(store: AppHelper.exampleStore),
                        );
                      } else if (controller.hasError.value) {
                        return Text(controller.errorMessage.value);
                      } else {
                        final stores = controller.stores.value;
                        return VerticalStoreCard(store: stores[index]);
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
