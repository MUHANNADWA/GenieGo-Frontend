import 'package:geniego/utils/http/http_client.dart';

class ShopService {
  static getStores() {
    return AppHttpHelper.get('stores');
  }

  static getStoreById(id) {
    return AppHttpHelper.get('stores/$id');
  }

  static getStoreProductsByStoreId(id) {
    return AppHttpHelper.get('stores/$id/products');
  }

  static deleteStoreById(id) {
    return AppHttpHelper.delete('stores/$id');
  }

  static getProducts() {
    return AppHttpHelper.get('products');
  }

  static getProductById(id) {
    return AppHttpHelper.get('products/$id');
  }

  static deleteProductById(id) {
    return AppHttpHelper.delete('products/$id');
  }
}
