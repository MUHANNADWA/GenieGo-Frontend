import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/controllers/cart/cart_controller.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key, this.address, this.showChangeButton});

  final Site? address;
  final bool? showChangeButton;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping Address',
          showActionButton: showChangeButton ?? true,
          buttonTitle: 'Change',
          onPressed: () => controller.changeAddress(),
        ),

        const SizedBox(height: AppSizes.spaceBtwItems),

        // Shipping Info
        address?.address == AppHelper.exampleSite.address
            ? SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => controller.changeAddress(),
                    child: Text('Choose Address')),
              )
            : Wrap(
                spacing: AppSizes.sm,
                runSpacing: AppSizes.sm,
                children: [
                  // Phone
                  Row(
                    children: [
                      Icon(
                        Iconsax.attach_circle,
                        size: 16,
                      ),

                      const SizedBox(width: AppSizes.sm),

                      // Name
                      Text(address?.name ?? 'No Name Provided',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 16,
                      ),

                      const SizedBox(width: AppSizes.sm),

                      // Address
                      Text(
                        address?.address ?? 'No Address Provided',
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
