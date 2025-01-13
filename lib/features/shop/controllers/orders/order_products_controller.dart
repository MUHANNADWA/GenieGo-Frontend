import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class OrderItemsController extends GetxController {
  static OrderItemsController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxMap<int, RxMap<Product, RxInt>> orderItems =
      <int, RxMap<Product, RxInt>>{}.obs;

  Future<void> getOrderItemsByOrderId(id) async =>
      !orderItems.value.containsKey(id)
          ? await fetchOrderItemsByOrderId(id)
          : DoNothingAction();

  Future<void> refreshOrderItemsByOrderId(id) async =>
      await fetchOrderItemsByOrderId(id);

  Future<void> fetchOrderItemsByOrderId(id) async {
    try {
      log('Fetching Items For The Order With Id: $id 🔄');

      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getOrderById(id);
      final orderItemsData = data['data']['products'];

      for (var i = 0; i < orderItemsData.length; i++) {
        final product =
            await ShopService.getProductById(orderItemsData[i]['id']);
        final quantity =
            await ShopService.getProductById(orderItemsData[i]['quantity']);
        orderItems.value.addAll({
          id,
          {Product.fromJson(product), RxInt(quantity)}
        } as Map<int, RxMap<Product, RxInt>>);
      }

      log('Items For The Order With Id: $id Fetched Successfully ✅  response = ${orderItems.value.map((orderId, products) => MapEntry(orderId, products.map((product, quantity) => MapEntry(product.toJson(), quantity))))}');
    } catch (e) {
      log('Error Fetching Items For The Order With Id: $id ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
