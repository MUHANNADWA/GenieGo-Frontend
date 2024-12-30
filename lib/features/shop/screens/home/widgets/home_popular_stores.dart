import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/image_text_widgets/vertical_store_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class HomePopularStores extends StatelessWidget {
  const HomePopularStores({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          // Popular Stores Heading
          SectionHeading(
            title: AppTexts.popularStores,
            textColor: AppColors.lightGrey,
          ),

          const SizedBox(height: AppSizes.spaceBtwItems),

          // Popular Stores List
          FutureBuilder(
            future: ShopService.getStores(),
            builder: (context, snapshot) {
              return SizedBox(
                height: 90,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      final dynamic stores = snapshot.data!;
                      final store = stores['data'][index];
                      return VerticalStoreCard(store: Store.fromJson(store));
                    } else {
                      return AppShimmer(
                        child: VerticalStoreCard(store: AppHelper.exampleStore),
                      );
                    }
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
