import 'dart:developer';

import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Store> stores = <Store>[].obs;

  Future<void> fetchDashboardItems(query, tags) async {
    try {
      log('Fetching Products and Stores in Dashboard 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getStoreById(1);
      final List<dynamic> productsData = data['data']['products'] ?? [];
      final List<dynamic> storesData = data['data']['stores'] ?? [];

      products.value = List.generate(
        productsData.length,
        (index) => Product.fromJson(productsData[index]),
      );

      stores.value = List.generate(
        storesData.length,
        (index) => Store.fromJson(storesData[index]),
      );

      products.refresh();
      stores.refresh();

      log('Dashboard for Products and Stores Fetched Successfully ✅ response = ${products.value.map((product) => product.toJson())}');
    } catch (e) {
      log('Error Fetching Products and Stores in Dashboard ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
