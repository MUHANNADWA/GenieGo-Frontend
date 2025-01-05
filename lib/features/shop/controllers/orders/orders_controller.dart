import 'dart:developer';
import 'package:geniego/features/shop/models/order_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
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
    fetchOrders();
  }

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

  Future<void> addOrder(productId) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      await ShopService.addOrder(productId);

      orders.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteOrderById(productId) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      await ShopService.deleteOrderById(productId);

      orders.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
