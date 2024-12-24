import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class VerticalImageAndName extends StatelessWidget {
  const VerticalImageAndName({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgrongdColor,
    this.onTap,
    this.isNetworkImage = false,
  });

  final String image, title;
  final bool isNetworkImage;
  final Color? textColor, backgrongdColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Store Image
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems),
            padding: const EdgeInsets.all(AppSizes.sm),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: backgrongdColor ??
                  (AppHelper.isDarkMode ? AppColors.dark : AppColors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image(
                image: isNetworkImage
                    ? NetworkImage(image)
                    : AssetImage(image) as ImageProvider,
                fit: BoxFit.cover,
                color: backgrongdColor ??
                    (AppHelper.isDarkMode ? AppColors.white : AppColors.dark),
              ),
            ),
          ),

          const SizedBox(
            height: AppSizes.spaceBtwItems / 2,
          ),

          // Store Name
          SizedBox(
            width: 60,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
