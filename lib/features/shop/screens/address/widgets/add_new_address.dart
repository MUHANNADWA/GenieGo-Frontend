import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                //
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),

                SizedBox(
                  height: AppSizes.spaceBtwInputFields,
                ),

                //
                Row(
                  children: [],
                ),

                SizedBox(
                  height: AppSizes.spaceBtwInputFields,
                ),

                //
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.building,
                          ),
                          labelText: 'Address',
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: AppSizes.defaultSpace,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text('Save')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
