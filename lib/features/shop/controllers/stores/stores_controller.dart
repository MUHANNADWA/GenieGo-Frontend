import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:get/get.dart';

class StoresController extends GetxController {
  static StoresController get instance => Get.find();

  RxList<Store> stores = <Store>[].obs;
  RxMap<int, RxList<Product>> storeProducts = <int, RxList<Product>>{}.obs;

  Future<List<Store>> getStores() async {
    if (stores.firstRebuild) {
      final data = await ShopService.getStores();
      final storesData = data['data'];
      stores.value = List.generate(
          storesData.length, (index) => Store.fromJson(storesData[index]));
    }
    return stores.value;
  }

  Future<List<Store>> refreshStores() async {
    final data = await ShopService.getStores();
    final storesData = data['data'];
    stores.value = List.generate(
        storesData.length, (index) => Store.fromJson(storesData[index]));
    return stores.value;
  }

  Future<List<Product>> getStoreProductsByStoreId(id) async {
    if (storeProducts[id]!.firstRebuild) {
      final data = await ShopService.getStoreProductsByStoreId(id);
      final storeProductsData = data['data'];
      storeProducts[id]!.value = List.generate(storeProductsData.length,
          (index) => Product.fromJson(storeProductsData[index]));
    }
    return storeProducts[id]!.value;
  }

  Future<List<Product>> refreshStoreProductsByStoreId(id) async {
    final data = await ShopService.getStoreProductsByStoreId(id);
    final storeProductsData = data['data'];
    storeProducts[id]!.value = List.generate(storeProductsData.length,
        (index) => Product.fromJson(storeProductsData[index]));
    return storeProducts[id]!.value;
  }
}
