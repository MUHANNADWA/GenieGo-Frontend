import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.searchText,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = false,
    this.onTap,
  });

  final String searchText;
  final IconData? icon;
  final bool? showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.xs),
          decoration: BoxDecoration(
            color: showBackground!
                ? AppHelper.isDarkMode
                    ? AppColors.dark
                    : AppColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: showBorder!
                ? Border.all(
                    color:
                        AppHelper.isDarkMode ? AppColors.light : AppColors.dark)
                : null,
          ),
          child: Row(
            children: [
              // Search Icon
              IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: AppHelper.isDarkMode
                      ? AppColors.lightGrey
                      : AppColors.darkerGrey,
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Search Text
              Text(
                searchText,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: AppHelper.isDarkMode
                          ? AppColors.grey
                          : AppColors.darkGrey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
