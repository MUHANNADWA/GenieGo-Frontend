import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Save Changes')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
