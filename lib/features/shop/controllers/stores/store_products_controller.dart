import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class StoreProductsController extends GetxController {
  static StoreProductsController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxMap<int, List<Product>> storeProducts = <int, List<Product>>{}.obs;

  Future<void> getStoreProductsByStoreId(id) async =>
      !storeProducts.value.containsKey(id)
          ? await fetchStoreProductsByStoreId(id)
          : DoNothingAction();

  Future<void> refreshStoreProductsByStoreId(id) async =>
      await fetchStoreProductsByStoreId(id);

  Future<void> fetchStoreProductsByStoreId(id) async {
    try {
      log('Fetching Products For The Store With Id: $id 🔄');

      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getStoreProductsByStoreId(id);
      final storeProductsData = data['data'];

      print(storeProductsData);

      storeProducts.value[id] = List.generate(
        storeProductsData.length,
        (index) => Product.fromJson(storeProductsData[index]),
      );

      log('Products For The Store With Id: $id Fetched Successfully ✅');
    } catch (e) {
      log('Error Fetching Products For The Store With Id: $id ❌');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
