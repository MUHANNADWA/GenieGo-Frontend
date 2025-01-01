import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  RxList<Product> products = <Product>[].obs;

  @override
  onInit() {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts() async =>
      products.firstRebuild ? await fetchProducts() : DoNothingAction();

  Future<void> refreshProducts() async => await fetchProducts();

  Future<void> fetchProducts() async {
    try {
      log('Fetching Products 🔄');
      log('debug 1');
      isLoading.value = true;
      hasError.value = false;
      log('debug 2');

      log('debug 3');
      final data = await ShopService.getProducts();
      log('debug 4');
      final productsData = data['data'];
      log('debug 5');

      log(productsData.toString());

      log('debug 6');
      products.value = List.generate(
        productsData.length,
        (index) => Product.fromJson(productsData[index]),
      );
      log('debug 7');

      products.refresh();

      log('Products Fetched Successfully ✅');
    } catch (e) {
      log('Error Fetching Products ❌');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}