import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';

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

        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),

        // Shipping Info
        Row(
          children: [
            Icon(
              Icons.phone,
              color: AppColors.grey,
              size: 16,
            ),

            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),

            // Phone
            Text(
              '+92-317-8059525',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),

            // Location
            Row(
              children: [
                Icon(
                  Icons.location_history,
                  color: AppColors.grey,
                  size: 16,
                ),

                const SizedBox(
                  width: AppSizes.spaceBtwItems,
                ),

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
