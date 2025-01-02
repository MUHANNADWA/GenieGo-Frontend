import 'dart:developer';

import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final RxMap<Product, RxInt> cartItems = <Product, RxInt>{}.obs;
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> fetchCartProducts() async {
    try {
      log('Fetching Cart Items 🔄');

      isLoading.value = true;
      hasError.value = false;

      final List items = GetStorage().read('cartItems');
      final List quantities = GetStorage().read('cartQuantites');

      final Map quant = Map.fromIterables(items, quantities);

      cartItems.value = Map.from(quant.map((product, count) =>
          MapEntry(Product.fromJson(product), RxInt(count))));

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
    print('🔰 increasing .. ${product.toJson().toString()}');

    if (cartItems.containsKey(product) &&
        getQuantity(product) < product.stock) {
      cartItems[product]!.value++;
    } else if (!cartItems.containsKey(product)) {
      cartItems[product] = 1.obs;
    }

    await updateCart();
  }

  void decreaseQuantity(product) async {
    print('🔰 decreasing .. ${product.toJson().toString()}');
    if (cartItems.containsKey(product) && getQuantity(product) > 1) {
      cartItems[product]!.value--;
    } else if (cartItems.containsKey(product) && getQuantity(product) == 1) {
      cartItems.remove(product);
      removeFromCart(product);
    }
    await updateCart();
  }

  int getQuantity(product) => cartItems[product]?.value ?? 0;

  Future<void> addToCart(Product product) async {
    print('🔰 adding .. ${product.toJson().toString()}');
    cartItems.value.addAll({product: RxInt(getQuantity(product))});
    await updateCart();
    AppLoaders.infoSnackBar(title: 'added');
  }

  Future<void> removeFromCart(Product product) async {
    print('🔰 removing .. ${product.toJson().toString()}');
    cartItems.value.remove(product);
    await updateCart();
    AppLoaders.warningSnackBar(title: 'removed');
  }

  Future<void> updateCart() async {
    final List items =
        cartItems.value.keys.map((product) => product.toJson()).toList();
    final List<int> quantities =
        cartItems.value.values.map((count) => count.value).toList();

    await GetStorage().write('cartItems', items);
    await GetStorage().write('cartQuantites', quantities);
  }
}
