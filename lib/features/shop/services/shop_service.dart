import 'package:geniego/utils/http/http_client.dart';

class ShopService {
  // Stores
  static getStores() async => await AppHttpHelper.get('stores');
  static getStoreById(id) async => await AppHttpHelper.get('stores/$id');
  static addStore(data) async => await AppHttpHelper.post('stores', data);
  static updateStoreById(id, data) async =>
      await AppHttpHelper.put('stores/$id', data);
  static updateStoreByIdWithImage(id, data, image) async =>
      await AppHttpHelper.postMultipart('stores', data, image);
  static getStoreProductsByStoreId(id) async =>
      await AppHttpHelper.get('stores/$id/products');
  static deleteStoreById(id) async => await AppHttpHelper.delete('stores/$id');

  // Products
  static getProducts() async => await AppHttpHelper.get('products');
  static getProductById(id) async => await AppHttpHelper.get('products/$id');
  static addProduct(data) async => await AppHttpHelper.post('products', data);
  static updateProductById(id, data) async =>
      await AppHttpHelper.put('products/$id', data);
  static updateProductByIdWithImage(id, data, image) async =>
      await AppHttpHelper.postMultipart('products', data, image);
  static deleteProductById(id) async =>
      await AppHttpHelper.delete('products/$id');

  // Wishlist
  static getWishlist() async => await AppHttpHelper.get('wishlist');
  static addToWishlist(id) async => await AppHttpHelper.get('wishlist/$id');
  static removeFromWishlist(id) async =>
      await AppHttpHelper.get('wishlist/$id');

  // Orders
  static getOrders() async => await AppHttpHelper.get('orders');
  static getOrderById(id) async => await AppHttpHelper.get('orders/$id');
  static addOrder(data) async => await AppHttpHelper.post('orders', data);
  static updateOrderById(id, data) async =>
      await AppHttpHelper.put('orders/$id', data);
  static deleteOrderById(id) async => await AppHttpHelper.delete('orders/$id');

  // Sites
  static getSites() async => await AppHttpHelper.get('sites');
  static addSite(data) async => await AppHttpHelper.post('sites', data);
  static updateSiteById(id, data) async =>
      await AppHttpHelper.put('sites/$id', data);
  static getSiteById(id) async => await AppHttpHelper.get('sites/$id');
  static deleteSiteById(id) async => await AppHttpHelper.delete('sites/$id');
  static search(data) async => await AppHttpHelper.post('search', data);

  // Tags
  static getTags() async => await AppHttpHelper.get('tags');
}
