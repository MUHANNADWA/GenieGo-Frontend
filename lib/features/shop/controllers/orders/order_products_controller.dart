// import 'dart:developer';

// import 'package:flutter/widgets.dart';
// import 'package:geniego/features/shop/models/product_model.dart';
// import 'package:geniego/features/shop/services/shop_service.dart';
// import 'package:get/get.dart';

// class OrderItemsController extends GetxController {
//   static OrderItemsController get instance => Get.find();

//   final RxBool isLoading = true.obs;
//   final RxBool hasError = false.obs;
//   final RxString errorMessage = ''.obs;
//   final RxMap<int, List<Product>> orderItems = <int, List<Product>>{}.obs;

//   Future<void> getOrderItemsByOrderId(id) async =>
//       !orderItems.value.containsKey(id)
//           ? await fetchOrderItemsByOrderId(id)
//           : DoNothingAction();

//   Future<void> refreshOrderItemsByOrderId(id) async =>
//       await fetchOrderItemsByOrderId(id);

//   Future<void> fetchOrderItemsByOrderId(id) async {
//     try {
//       log('Fetching Items For The Order With Id: $id 🔄');

//       isLoading.value = true;
//       hasError.value = false;

//       final data = await ShopService.getOrderItemsByOrderId(id);
//       final orderItemsData = data['data'];

//       orderItems.value[id] = List.generate(
//         orderItemsData.length,
//         (index) => Product.fromJson(orderItemsData[index]),
//       );

//       log('Items For The Order With Id: $id Fetched Successfully ✅  response = ${orderItems.value.map((orderId, products) => MapEntry(orderId, products.map((product) => product.toJson())))}');
//     } catch (e) {
//       log('Error Fetching Items For The Order With Id: $id ❌ error = $e');

//       hasError.value = true;
//       errorMessage.value = e.toString();
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
