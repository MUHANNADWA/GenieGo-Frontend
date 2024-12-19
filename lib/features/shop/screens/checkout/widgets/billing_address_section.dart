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
          width: AppSizes.spaceBtwItems,
        ),
        Text(
          'Shipping Address',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
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
            Text(
              '+92-317-8059525',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
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
                Expanded(
                  child: Text(
                    'South Latina,Maine 87695,USA',
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
