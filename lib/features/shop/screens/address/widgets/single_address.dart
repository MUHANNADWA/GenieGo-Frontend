import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selected});

  final bool selected;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(AppSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          selected ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selected
          ? Colors.transparent
          : AppHelper.isDarkMode
              ? AppColors.darkerGrey
              : AppColors.dark,
      margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selected ? Iconsax.tick_circle5 : null,
                color: selected
                    ? AppHelper.isDarkMode
                        ? AppColors.light
                        : AppColors.dark.withOpacity(0.6)
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' John Doe ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSizes.sm / 2,
              ),
              const Text(
                '(+123) 465 7890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: AppSizes.sm / 2,
              ),
              Text(
                ' 82356 Timmy coves, South Liana, Maine, 87665, USA ',
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
