import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class StoresController extends GetxController {
  static StoresController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Store> stores = <Store>[].obs;

  @override
  onInit() {
    getStores();
    super.onInit();
  }

  Future<void> getStores() async =>
      stores.firstRebuild ? await fetchStores() : DoNothingAction();

  Future<void> refreshStores() async => await fetchStores();

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

      stores.refresh();

      log('Stores Fetched Successfully ✅ response = ${stores.value}');
    } catch (e) {
      log('Error Fetching Stores ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
