import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/controllers/addresses/addresses_controller.dart';
import 'package:geniego/features/shop/screens/address/widgets/add_new_address.dart';
import 'package:geniego/features/shop/screens/address/widgets/addresses_listview.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressesController());

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(AppTexts.addresses,
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: RefreshIndicator(
          onRefresh: () => controller.refreshSites(),
          child: Obx(
            () => controller.isLoading.value
                ? AppShimmer(child: RoundedContainer(height: 120))
                : controller.hasError.value
                    ? Text(controller.errorMessage.value)
                    : controller.addresses.value.isEmpty
                        ? Text('Empty')
                        : AddressesListview(
                            addresses: controller.addresses.value),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: AppColors.primary,
        child: Icon(Iconsax.add, color: AppColors.white),
      ),
    );
  }
}
