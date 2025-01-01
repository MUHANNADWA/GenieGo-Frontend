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

  static getFavourites() => AppHttpHelper.get('wishlist');

  static addToFavourites(id) => AppHttpHelper.get('wishlist/$id');

  static removeFromFavourites(id) => AppHttpHelper.get('wishlist/$id');
}
