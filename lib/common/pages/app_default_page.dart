import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class AppDefaultPage extends StatelessWidget {
  const AppDefaultPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.showActionButton,
    this.actionButtonText = 'Click',
    this.fullScreen = true,
    this.onPressedActionButton,
  });

  final String image;
  final String title, subTitle;
  final bool? showActionButton, fullScreen;
  final String actionButtonText;
  final VoidCallback? onPressedActionButton;

  @override
  Widget build(BuildContext context) {
    final width =
        fullScreen! ? AppHelper.screenWidth * 0.8 : AppHelper.screenWidth * 0.4;
    final height = fullScreen!
        ? AppHelper.screenHeight * 0.6
        : AppHelper.screenHeight * 0.3;

    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          // Image, Svg Or Lottie Image
          image.endsWith('.lottie')
              ? DotLottieLoader.fromAsset(
                  image,
                  frameBuilder: (BuildContext context, DotLottie? dotLottie) {
                    if (dotLottie != null) {
                      return Lottie.memory(
                        dotLottie.animations.values.single,
                        width: width,
                        height: height,
                        frameRate: FrameRate.max,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              : image.endsWith('.svg')
                  ? SvgPicture.asset(
                      image,
                      width: width,
                      height: height,
                    )
                  : Image(
                      image: AssetImage(image),
                      width: width,
                      height: height,
                    ),

          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSizes.spaceBtwItems),

          // Sub Title
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          // Action Button
          if (showActionButton == true)
            Column(
              children: [
                const SizedBox(height: AppSizes.spaceBtwSections),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressedActionButton,
                    child: Text(actionButtonText),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
