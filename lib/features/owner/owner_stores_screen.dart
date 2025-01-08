import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/shop/controllers/search/search_controller.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';

class OwnerStoresScreen extends StatelessWidget {
  const OwnerStoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppSearchController());
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text('My Stores'),
      ),
      body: Obx(() => controller.stores.value.isNotEmpty
          ? Column(
              children: [
                Divider(),
                SizedBox(height: AppSizes.sm),
                TitleText(title: 'Stores'),
                SizedBox(height: AppSizes.defaultSpace),
                GridLayout(
                  crossAxisCount: 1,
                  mainAxisExtent: 80,
                  itemCount: controller.stores.value.length,
                  itemBuilder: (_, index) =>
                      StoreCard(store: controller.stores.value[index]),
                ),
              ],
            )
          : SizedBox()),
    );
  }
}
