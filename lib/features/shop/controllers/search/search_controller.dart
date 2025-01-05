import 'dart:developer';

import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Store> stores = <Store>[].obs;

  Future<void> fetchProducts() async {
    try {
      log('Fetching Products 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getProducts();
      final List<dynamic> productsData = data['data'];

      products.value = List.generate(
        productsData.length,
        (index) => Product.fromJson(productsData[index]),
      );

      products.refresh();

      log('Products Fetched Successfully ✅ response = ${products.value.map((product) => product.toJson())}');
    } catch (e) {
      log('Error Fetching Products ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
