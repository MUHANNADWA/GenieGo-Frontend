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

  Future<void> initCart() async {
    await fetchCartProducts();
  }

  Future<void> fetchCartProducts() async {
    try {
      log('Fetching Cart Items 🔄');

      isLoading.value = true;
      hasError.value = false;

      final List items = GetStorage().read('cartItems') ?? [];
      final List quantities = GetStorage().read('cartQuantites') ?? [];

      final Map quant = Map.fromIterables(items, quantities);

      cartItems.value = Map.from(quant.map((product, count) =>
          MapEntry(Product.fromJson(product), RxInt(count))));

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
      print('🔰 increasing .. ${product.toJson().toString()}');
      cartItems[product]!.value++;
    } else if (!contains(product.id)) {
      cartItems[product] = 1.obs;
    }
  }

  void decreaseQuantity(product) async {
    if (contains(product.id) && getQuantity(product.id) > 1) {
      print('🔰 decreasing .. ${product.toJson().toString()}');
      cartItems[product]!.value--;
    } else if (contains(product.id) && getQuantity(product.id) == 1) {
      cartItems.remove(product);
      removeFromCart(product);
    }
  }

  bool contains(productId) => cartItems.isNotEmpty
      ? cartItems.value.keys.any((product) => product.id == productId)
      : false;
  Product? getProductById(productId) => contains(productId)
      ? cartItems.value.keys.firstWhere((product) => product.id == productId)
      : null;
  int getQuantity(int productId) => contains(productId)
      ? cartItems[getProductById(productId)]?.value ?? 0
      : 0;
  // int getQuantity(productId.id) => 0;

  Future<void> addToCart(Product product) async {
    cartItems.value.addAll({product: RxInt(getQuantity(product.id))});
    await updateCart();
    print('🔰 adding .. ${product.toJson().toString()}');
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
