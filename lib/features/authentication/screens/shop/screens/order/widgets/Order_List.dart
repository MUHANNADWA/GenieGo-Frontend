import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AppOrderListItems extends StatelessWidget {
  const AppOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode;

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.md),
        showBorder: true,
        backgroundColor: dark ? AppColors.dark : AppColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Row 1

            Row(
              children: [
                /// 1- Icon
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: AppSizes.spaceBtwItems / 2,
                ),

                /// 2-Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: AppColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text('07 Nov 2024',
                          style: Theme.of(context).textTheme.headlineSmall!),
                    ],
                  ),
                ),

                /// 3- Icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                    ),
                    iconSize: AppSizes.iconSm),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            ///Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1- Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: AppSizes.spaceBtwItems / 2,
                      ),

                      /// 2-Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('#256f2',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// 1- Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: AppSizes.spaceBtwItems / 2,
                      ),

                      /// 2-Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Data',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('03 feb 2025',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    /// 1- Icon
                    const Icon(Iconsax.ship),
                    const SizedBox(
                      width: AppSizes.spaceBtwItems / 2,
                    ),

                    /// 2-Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text('#256f2',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
