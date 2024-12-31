import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class StoresController extends GetxController {
  static StoresController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Store> stores = <Store>[].obs;
  final Map<int, RxList<Product>> storeProducts = <int, RxList<Product>>{};

  @override
  onInit() {
    getStores();
    getStoreProductsByStoreId(1);
    super.onInit();
  }

  Future<void> getStores() async =>
      stores.firstRebuild ? await fetchStores() : DoNothingAction();

  Future<void> refreshStores() async => await fetchStores();

  Future<void> getStoreProductsByStoreId(id) async =>
      storeProducts[id] == null || storeProducts[id]?.value == null
          ? await fetchStoreProductsByStoreId(id)
          : DoNothingAction();

  Future<void> refreshStoreProductsByStoreId(id) async =>
      await fetchStoreProductsByStoreId(id);

  Future<void> fetchStores() async {
    try {
      log('Fetching Stores 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getStores();
      final storesData = data['data'];

      stores.value = List.generate(
        storesData.length,
        (index) => Store.fromJson(storesData[index]),
      );

      log('Stores Fetched Successfully ✅');
    } catch (e) {
      log('Error Fetching Stores ❌');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchStoreProductsByStoreId(id) async {
    try {
      log('Fetching Products For The Store With Id: $id 🔄');

      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getStoreProductsByStoreId(id);
      final storeProductsData = data['data'];

      storeProducts[id]?.value = List.generate(
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
