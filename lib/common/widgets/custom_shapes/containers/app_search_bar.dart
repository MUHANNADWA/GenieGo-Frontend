import 'package:flutter/material.dart';
import 'package:geniego/features/shop/controllers/search/search_controller.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.searchText,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = false,
  });

  final String searchText;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppSearchController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: SearchBar(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(AppSizes.xs)),
        // Background Color
        backgroundColor: WidgetStatePropertyAll(
          showBackground
              ? AppHelper.isDarkMode
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
        ),

        // Border Color
        side: WidgetStatePropertyAll(
          BorderSide(
            color: showBorder
                ? AppHelper.isDarkMode
                    ? AppColors.light
                    : AppColors.dark
                : Colors.transparent,
          ),
        ),

        // Border Radius
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          ),
        ),

        // Search Icon
        leading: IconButton(onPressed: () {}, icon: Icon(icon)),

        onSubmitted: (value) => controller.search(value, []),

        onTapOutside: (event) => AppHelper.hideKeyboard(),

        // Search Text
        hintText: searchText,
      ),
    );
  }
}
