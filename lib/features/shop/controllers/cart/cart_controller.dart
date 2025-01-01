import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final quantity = <int, RxInt>{}.obs;

  void increaseQuantity(int productId) {
    if (quantity.containsKey(productId)) {
      quantity[productId]!.value++;
    } else {
      quantity[productId] = 1.obs;
    }
  }

  void decreaseQuantity(int productId) {
    if (quantity.containsKey(productId) && quantity[productId]!.value > 0) {
      quantity[productId]!.value--;
      if (quantity[productId]!.value == 0) {
        quantity.remove(productId);
      }
    }
  }

  int getQuantity(int productId) {
    return quantity[productId]?.value ?? 0;
  }
}
