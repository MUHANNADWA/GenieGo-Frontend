import 'package:geniego/utils/http/http_client.dart';

class ShopService {
  static getStores() async => await AppHttpHelper.get('stores');

  static getStoreById(id) async => await AppHttpHelper.get('stores/$id');

  static getStoreProductsByStoreId(id) async =>
      await AppHttpHelper.get('stores/$id/products');

  static deleteStoreById(id) async => await AppHttpHelper.delete('stores/$id');

  static getProducts() async => await AppHttpHelper.get('products');

  static getProductById(id) async => await AppHttpHelper.get('products/$id');

  static deleteProductById(id) async =>
      await AppHttpHelper.delete('products/$id');

  static getWishlist() async => await AppHttpHelper.get('wishlist');

  static addToWishlist(id) async => await AppHttpHelper.get('wishlist/$id');

  static removeFromWishlist(id) async =>
      await AppHttpHelper.get('wishlist/$id');

  static getOrders() async => await AppHttpHelper.get('orders');

  static addOrder(data) async => await AppHttpHelper.post('orders', data);

  static updateOrderById(id, data) async =>
      await AppHttpHelper.put('orders/$id', data);

  static getOrderById(id) async => await AppHttpHelper.get('orders/$id');

  static deleteOrderById(id) async => await AppHttpHelper.delete('orders/$id');

  static getSites() async => await AppHttpHelper.get('sites');

  static addSite(data) async => await AppHttpHelper.post('sites', data);

  static updateSiteById(id, data) async =>
      await AppHttpHelper.put('sites/$id', data);

  static getSiteById(id) async => await AppHttpHelper.get('sites/$id');

  static deleteSiteById(id) async => await AppHttpHelper.delete('sites/$id');

  static search(data) async => await AppHttpHelper.post('search', data);
}
