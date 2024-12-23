import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems / 2,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),

        /// Share Button
        IconButton(
            onPressed: () {}, icon: Icon(Icons.share, size: AppSizes.iconMd)),

        Row(
          children: [],
        )
      ],
    );
  }
}
