import 'package:geniego/utils/http/http_client.dart';

class ShopService {
  static getStores() => AppHttpHelper.get('stores');

  static getStoreById(id) => AppHttpHelper.get('stores/$id');

  static getStoreProductsByStoreId(id) =>
      AppHttpHelper.get('stores/$id/products');

  static deleteStoreById(id) => AppHttpHelper.delete('stores/$id');

  static getProducts() => AppHttpHelper.get('products');

  static getProductById(id) => AppHttpHelper.get('products/$id');

  static deleteProductById(id) => AppHttpHelper.delete('products/$id');

  static getWishlist() => AppHttpHelper.get('wishlist');

  static addToWishlist(id) => AppHttpHelper.get('wishlist/$id');

  static removeFromWishlist(id) => AppHttpHelper.get('wishlist/$id');

  static getOrders() => AppHttpHelper.get('orders');

  static addOrder(data) => AppHttpHelper.post('orders', data);

  static updateOrderById(id, data) => AppHttpHelper.put('orders/$id', data);

  static getOrderById(id) => AppHttpHelper.get('orders/$id');

  static deleteOrderById(id) => AppHttpHelper.delete('orders/$id');
}
