import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/image_text_widgets/vertical_image_and_name.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class HomePopularStores extends StatelessWidget {
  const HomePopularStores({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        children: [
          // Popular Stores Heading
          const SectionHeading(
            title: 'Popular Stores',
            showActionButton: false,
            textColor: AppColors.lightGrey,
          ),

          const SizedBox(height: AppSizes.spaceBtwItems),

          // Popular Stores List
          FutureBuilder(
              future: ShopService.getStores(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show shimmer loading
                  return SizedBox(
                    height: 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6, // Number of shimmer placeholders
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          period: Duration(seconds: 2),
                          baseColor: AppHelper.isDarkMode
                              ? AppColors.dark
                              : AppColors.light,
                          highlightColor: AppHelper.isDarkMode
                              ? AppColors.darkerGrey
                              : AppColors.darkGrey,
                          child: VerticalImageAndName(
                            image: AppImages.appLogo,
                            title: 'Loading ...',
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasData) {
                  // Show the actual data
                  final dynamic stores = snapshot.data!;
                  return SizedBox(
                    height: 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final store = stores['data'][index];

                        return GestureDetector(
                          child: VerticalImageAndName(
                            isNetworkImage: true,
                            image: store['icon_url'],
                            title: store['translations']
                                [AppHelper.currentLang.substring(0, 2)]['name'],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Show error message
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  // Fallback UI
                  return const SizedBox.shrink();
                }
              }),
        ],
      ),
    );
  }
}
