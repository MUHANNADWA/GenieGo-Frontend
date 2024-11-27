import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';

class AppAnimationLoaderWidget extends StatelessWidget {
  const AppAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Loading Image
          DotLottieLoader.fromAsset(
            animation,
            frameBuilder: (BuildContext context, DotLottie? dotLottie) {
              if (dotLottie != null) {
                return Lottie.memory(
                  dotLottie.animations.values.single,
                  width: AppHelper.screenWidth * 0.8,
                  height: AppHelper.screenHeight * 0.6,
                );
              } else {
                return Container();
              }
            },
          ),

          const SizedBox(height: AppSizes.defaultSpace),

          // Loading Text
          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
