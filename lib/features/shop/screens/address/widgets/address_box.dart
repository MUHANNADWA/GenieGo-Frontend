import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key, required this.selected, required this.address});

  final Site address;
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
                address.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                address.address,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
