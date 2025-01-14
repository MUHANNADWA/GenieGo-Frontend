import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/controllers/addresses/addresses_controller.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key, this.address});

  final Site? address;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressesController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () => controller.changeAddress(),
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
                  Iconsax.attach_circle,
                  color: AppColors.grey,
                  size: 16,
                ),

                const SizedBox(width: AppSizes.sm),

                // Name
                Obx(
                  () => Text(address?.name ?? 'No Name Provided',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
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
                Obx(
                  () => Text(
                    address?.address ?? 'No Address Provided',
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
