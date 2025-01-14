import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/order_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/main_screen.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:get/get.dart';

class OredrsController extends GetxController {
  static OredrsController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Order> orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  Future<void> getOrders() async =>
      orders.firstRebuild ? await fetchOrders() : DoNothingAction();

  Future<void> refreshOrders() async => await fetchOrders();

  Future<void> fetchOrders() async {
    try {
      log('Fetching Orders 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getOrders();
      final ordersData = data['data'];

      orders.value = List.generate(
        ordersData.length,
        (index) => Order.fromJson(ordersData[index]),
      );

      orders.refresh();

      log('Orders Fetched Successfully ✅ response = ${orders.value.map((product) => product.toJson())}');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();

      log('Error Fetching Orders ❌ error = $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addOrder(Map<int, RxInt> cartItems) async {
    try {
      log('Adding Order 🔄');
      isLoading.value = true;
      hasError.value = false;

      List<Map<String, int>> orderItems = cartItems.entries
          .map((entry) => {'id': entry.key, 'quantity': entry.value.value})
          .toList();

      final orderData = {'site_id': 2, 'products': orderItems};

      await ShopService.addOrder(orderData);

      AppDialogs.showSuccessDialog(
        'Your Order has been added!',
        'Your Item Will Be Shipped Soon, Do Not Forget To Pay For The Delivery Man',
        AppImages.successfulPaymentIcon,
        () => Get.offAll(() => const MainScreen()),
      );
    } catch (e) {
      log('Error Fetching Orders ❌ error = $e');
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editOrder(id) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final orderData = {
        //
      };

      await ShopService.updateOrderById(id, orderData);

      orders.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteOrderById(id) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      await ShopService.deleteOrderById(id);

      orders.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
