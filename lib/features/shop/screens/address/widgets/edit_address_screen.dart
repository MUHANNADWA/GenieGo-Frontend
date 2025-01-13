import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/features/shop/controllers/addresses/addresses_controller.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key, required this.address});

  final Site address;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressesController());

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text('Edit Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                //
                TextFormField(
                  controller: controller.editName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),

                SizedBox(height: AppSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLines: null,
                        controller: controller.editAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'Address',
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: AppSizes.defaultSpace),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.editSite(address.id),
                    child: Text('Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
