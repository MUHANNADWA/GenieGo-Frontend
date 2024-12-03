import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [CartCounterIcon(onPressed: () {})],
      ),
      body: Column(
        children: [
          AppSearchBar(
            searchText: 'searchText',
            showBackground: false,
            showBorder: true,
          ),

          // Store Card
          RoundedContainer(
            padding: EdgeInsets.all(AppSizes.sm),
            showBorder: true,
            backgroundColor: Colors.transparent,
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  padding: EdgeInsets.all(AppSizes.sm),
                  decoration: BoxDecoration(
                    color:
                        AppHelper.isDarkMode ? AppColors.dark : AppColors.light,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: AppCircularImage(
                    backgroundColor: Colors.transparent,
                    image: AppImages.clothIcon,
                    overlayColor:
                        AppHelper.isDarkMode ? AppColors.light : AppColors.dark,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
