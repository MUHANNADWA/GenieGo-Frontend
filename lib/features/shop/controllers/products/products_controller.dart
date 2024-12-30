import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  RxList<Product> products = <Product>[].obs;

  Future<List<Product>> getProducts() async {
    if (products.firstRebuild) {
      final data = await ShopService.getProducts();
      final productsData = data['data'];
      products.value = List.generate(productsData.length,
          (index) => Product.fromJson(productsData[index]));
    }
    return products.value;
  }

  Future<List<Product>> refreshProducts() async {
    final data = await ShopService.getProducts();
    final productsData = data['data'];
    products.value = List.generate(
        productsData.length, (index) => Product.fromJson(productsData[index]));
    return products.value;
  }
}
