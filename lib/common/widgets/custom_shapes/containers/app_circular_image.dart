import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class AppCircularImage extends StatelessWidget {
  const AppCircularImage({
    super.key,
    required this.image,
    this.height = 56,
    this.width = 56,
    this.boxFit = BoxFit.cover,
    this.padding = 0,
    this.overlayColor,
    this.backgroundColor,
    this.isNetworkImage = false,
  });

  final double height, width, padding;
  final String image;
  final BoxFit boxFit;
  final Color? overlayColor, backgroundColor;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (AppHelper.isDarkMode ? AppColors.dark : AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        color: overlayColor,
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        fit: boxFit,
      ),
    );
  }
}
