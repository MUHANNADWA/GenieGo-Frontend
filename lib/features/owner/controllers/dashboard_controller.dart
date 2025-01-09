import 'dart:developer';

import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  @override
  onInit() {
    super.onInit();
    fetchDashboardItems();
  }

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  RxList<Product> products = <Product>[].obs;
  Store? store;

  Future<void> fetchDashboardItems() async {
    try {
      log('Fetching Products and Stores in Dashboard 🔄');
      isLoading.value = true;
      hasError.value = false;

      final storedata =
          await ShopService.getStoreById(AuthService.currentUser.storeId);
      final productsdata = await ShopService.getStoreProductsByStoreId(
          AuthService.currentUser.storeId);
      final List<dynamic> productsData = productsdata['data'] ?? [];
      final storeData = storedata['data'] ?? [];

      products.value = List.generate(
        productsData.length,
        (index) => Product.fromJson(productsData[index]),
      );

      store = Store.fromJson(storeData);

      products.refresh();

      log('Dashboard for Products and Stores Fetched Successfully ✅ response = ${products.value.map((product) => product.toJson())}');
    } catch (e) {
      log('Error Fetching Products and Stores in Dashboard ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  addStore() {}
}
