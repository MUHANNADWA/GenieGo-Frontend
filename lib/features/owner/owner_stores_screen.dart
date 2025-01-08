import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/product_card/product_card.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/features/owner/add_store_screen.dart';
import 'package:geniego/features/shop/controllers/search/search_controller.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
      floatingActionButton: ElevatedButton(
          onPressed: () => Get.to(() => AddStoreScreen()), child: Text('+')),
    );
  }
}
