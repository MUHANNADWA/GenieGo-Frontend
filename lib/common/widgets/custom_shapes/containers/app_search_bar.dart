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
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: SearchAnchor.bar(
        // isFullScreen: false,
        barPadding: const WidgetStatePropertyAll(EdgeInsets.all(AppSizes.xs)),
        // Background Color
        barBackgroundColor: WidgetStatePropertyAll(
          showBackground
              ? AppHelper.isDarkMode
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
        ),

        viewBackgroundColor: AppColors.darkLight,

        viewShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
        ),

        // Border Color
        barSide: WidgetStatePropertyAll(
          BorderSide(
            color: showBorder
                ? AppHelper.isDarkMode
                    ? AppColors.light
                    : AppColors.dark
                : Colors.transparent,
          ),
        ),

        // Border Radius
        barShape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          ),
        ),

        // Search Icon
        barLeading: IconButton(onPressed: () {}, icon: Icon(icon)),

        // Search Text
        barHintText: searchText,

        onTap: () => AppHelper.hideKeyboard(),

        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          final String input = controller.value.text;
          return [
            ListTile(leading: Text(input)),
            ListTile(leading: Text('hi')),
            ListTile(leading: Text('hi')),
            ListTile(leading: Text('hi')),
            ListTile(leading: Text('hi')),
            ListTile(leading: Text('hi')),
          ];
        },
      ),
    );
  }
}
