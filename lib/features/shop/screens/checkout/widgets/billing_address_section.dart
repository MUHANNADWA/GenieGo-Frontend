import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),

        const SizedBox(height: AppSizes.spaceBtwItems),

        // Shipping Info
        Wrap(
          spacing: AppSizes.sm,
          runSpacing: AppSizes.sm,
          children: [
            // Phone
            Row(
              children: [
                Icon(
                  Iconsax.call,
                  color: AppColors.grey,
                  size: 16,
                ),

                const SizedBox(width: AppSizes.sm),

                // Phone
                Text('+92-317-8059525',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),

            // Location
            Row(
              children: [
                Icon(
                  Iconsax.location,
                  color: AppColors.grey,
                  size: 16,
                ),

                const SizedBox(width: AppSizes.sm),

                // Address
                Text(
                  'South Latina, Maine 87695, USA',
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
