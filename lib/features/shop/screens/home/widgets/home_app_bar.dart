import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: AppColors.grey,
                ),
          ),

          // SubTitle
          Text(
            AppTexts.homeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: AppColors.white,
                ),
          ),
        ],
      ),
      actions: [
        // Cart Icon
        CartCounterIcon(
            onPressed: () {},
            iconColor: AppColors.white,
            counterBgColor: AppColors.black,
            counterTextColor: AppColors.white),
      ],
    );
  }
}
