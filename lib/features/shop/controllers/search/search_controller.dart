import 'dart:developer';

import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/screens/search_results/search_results_screen.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class AppSearchController extends GetxController {
  static AppSearchController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Store> stores = <Store>[].obs;

  Future<void> search(query, tags) async {
    Get.to(() => SearchResultsScreen(), fullscreenDialog: true);
    await fetchSearchResults(query, tags);
  }

  Future<void> fetchSearchResults(query, tags) async {
    try {
      log('Fetching Products and Stores in Search 🔄');
      isLoading.value = true;
      hasError.value = false;

      final searchData = {
        'query': query ?? '',
        'tags': tags ?? [],
      };

      final data = await ShopService.search(searchData);
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

      log('Search for Products and Stores Fetched Successfully ✅ response = ${products.value.map((product) => product.toJson())}');
    } catch (e) {
      log('Error Fetching Products and Stores in Search ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
