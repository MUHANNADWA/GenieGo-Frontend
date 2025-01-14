import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/features/shop/controllers/addresses/addresses_controller.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/features/shop/screens/address/widgets/edit_address_screen.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key, required this.address});

  final Site address;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressesController());

    return GestureDetector(
      onTap: () => controller.activeAddress = address,
      child: RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.md),
        width: double.infinity,
        showBorder: true,
        backgroundColor: Colors.transparent,
        borderColor:
            AppHelper.isDarkMode ? AppColors.darkerGrey : AppColors.dark,
        margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSizes.sm),
                  Text(
                    address.address,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  // Edit
                  IconButton(
                      onPressed: () =>
                          Get.to(() => EditAddressScreen(address: address)),
                      icon: Icon(Iconsax.edit)),
                  // Delete
                  IconButton(
                      onPressed: () => controller.deleteSiteById(address.id),
                      icon: Icon(Iconsax.trash)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
