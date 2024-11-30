import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/image_text_widgets/vertical_image_and_name.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';

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
          SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const VerticalImageAndName(
                  image: AppImages.acerlogo,
                  title: 'acer inds dsniv',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
