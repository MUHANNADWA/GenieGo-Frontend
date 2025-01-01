import 'dart:developer';

import 'package:geniego/features/shop/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final RxMap<Product, RxInt> quantity = <Product, RxInt>{}.obs;
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Product> cartItems = <Product>[].obs;

  Future<void> fetchCartProducts() async {
    try {
      log('Fetching Cart Items 🔄');
      isLoading.value = true;
      hasError.value = false;

      final productsData = GetStorage().read('cartItems');
      final quantities = GetStorage().read('cartQuantites');

      quantity.value = quantities;

      cartItems.value = List.generate(
        productsData.length,
        (index) => Product.fromJson(productsData[index]),
      );

      cartItems.refresh();

      log('Cart Items Fetched Successfully ✅');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();

      log('Error Fetching Cart Items ❌ $e');
    } finally {
      isLoading.value = false;
    }
  }

  void increaseQuantity(Product product) async {
    if (quantity.containsKey(product) &&
        quantity[product]!.value < product.stock) {
      quantity[product]!.value++;
    } else if (!quantity.containsKey(product)) {
      quantity[product] = 1.obs;
    }
    await GetStorage().write('cartQuantites', quantity.value.keys.toList());
  }

  void decreaseQuantity(product) async {
    if (quantity.containsKey(product) && quantity[product]!.value > 0) {
      quantity[product]!.value--;
    } else if (quantity[product]!.value == 0) {
      quantity.remove(product);
      removeFromCart(product);
    }
    await GetStorage().write('cartQuantites', quantity.value.keys.toList());
  }

  int getQuantity(product) => quantity[product]?.value ?? 0;

  Future<void> addToCart(product) async {
    cartItems.value.add(product);
    await GetStorage().write('cartItems', cartItems.value);
  }

  Future<void> removeFromCart(product) async {
    cartItems.value.remove(product);
    await GetStorage().write('cartItems', cartItems.value);
  }
}
