import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/features/shop/screens/address/addresses_screen.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final RxMap<int, RxInt> cartItems = <int, RxInt>{}.obs;
  final RxMap<Product, RxInt> cartProducts = <Product, RxInt>{}.obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> initCart() async {
    isLoading.firstRebuild && isLoading.value != true
        ? await fetchCartProducts()
        : DoNothingAction();
  }

  Future<void> fetchCartProducts() async {
    try {
      log('Fetching Cart Items 🔄');

      isLoading.value = true;
      hasError.value = false;

      final List items = GetStorage().read('cartItems') ?? [];
      final List quantities = GetStorage().read('cartQuantites') ?? [];

      List<Product> products = [];
      for (var i = 0; i < items.length; i++) {
        final response = await ShopService.getProductById(items[i]);
        products.add(Product.fromJson(response['data']));
      }

      final itemss = items.map((m) => int.parse(m.toString()));

      cartItems.value = Map.fromIterables(
          itemss, quantities.map((quantity) => RxInt(quantity)));

      cartProducts.value = Map.fromIterables(
          products, quantities.map((quantity) => RxInt(quantity)));

      cartItems.refresh();

      log('Cart Items Fetched Successfully ✅ response = ${cartItems.value}');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();

      log('Error Fetching Cart Items ❌ error = $e');
    } finally {
      isLoading.value = false;
    }
  }

  void increaseQuantity(Product product) async {
    if (contains(product.id) && getQuantity(product.id) < product.stock) {
      log('🔰 increasing product with the id: ${product.id} ..');
      cartItems[product.id]!.value++;
    } else if (!contains(product.id) && product.stock > 0) {
      cartItems[product.id] = 1.obs;
    }
  }

  void decreaseQuantity(Product product) async {
    if (contains(product.id) && getQuantity(product.id) > 1) {
      log('🔰 decreasing product with the id: ${product.id} ..');
      cartItems[product.id]!.value--;
    } else if (contains(product.id) && getQuantity(product.id) == 1) {
      cartItems.remove(product.id);
      removeFromCart(product);
    }
  }

  bool contains(productId) => cartItems.containsKey(productId);

  int? getProductById(productId) => contains(productId)
      ? cartItems.value.keys.firstWhere((id) => id == productId)
      : null;

  int getQuantity(int productId) => contains(productId)
      ? cartItems[getProductById(productId)]?.value ?? 0
      : 0;

  Future<void> addToCart(Product product) async {
    cartItems.value.addAll({product.id: RxInt(getQuantity(product.id))});
    await updateCart();
    log('🔰 adding product with the id: ${product.id} ..');
    AppLoaders.infoSnackBar(
        title: 'Added', message: 'This product has been added to your cart');
  }

  Future<void> removeFromCart(Product product) async {
    log('🔰 removing product with the id: ${product.id} ..');
    cartItems.value.remove(product.id);
    await updateCart();
    AppLoaders.warningSnackBar(
        title: 'removed',
        message: 'This product has been removed from your cart');
  }

  Future<void> updateCart() async {
    final List items = cartItems.value.keys.toList();
    final List<int> quantities =
        cartItems.value.values.map((count) => count.value).toList();

    await GetStorage().write('cartItems', items);
    await GetStorage().write('cartQuantites', quantities);
  }

  Future<void> clearCart() async {
    cartItems.clear();
    cartProducts.clear();

    cartItems.value = {};
    cartProducts.value = {};

    await GetStorage().remove('cartItems');
    await GetStorage().remove('cartQuantites');
  }

  double getTotalPrice() {
    double price = 0.0;
    for (var i = 0; i < cartProducts.length; i++) {
      final productPrice = cartProducts.keys.elementAt(i).price;
      final productQuantity = cartProducts.values.elementAt(i).value;
      price += productPrice * productQuantity;
    }
    return price;
  }

  Rx<Site> activeAddress = AppHelper.exampleSite.obs;
  changeAddress() {
    Get.to(() => AddressScreen(activateChangeAddress: true));
  }
}
