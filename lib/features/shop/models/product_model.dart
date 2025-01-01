import 'dart:math';

import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Product {
  final int id;
  final double price;
  final String name;
  final String description;
  final String image;
  final int stock;
  final List tags;
  final int storeId;
  Store? store;

  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.description,
    required this.image,
    required this.stock,
    required this.tags,
    required this.storeId,
    this.store,
  });

  factory Product.fromJson(jsonData) => Product(
        id: jsonData['id'],
        price: double.parse(jsonData['price']),
        name: jsonData['name'] ??
            jsonData['translations'][AppHelper.currentLang]['name'],
        description: jsonData['description'] ??
            jsonData['translations'][AppHelper.currentLang]['description'],
        image: jsonData['icon_url'] ?? AppImages.productImage,
        stock: jsonData['stock'] ?? Random().nextInt(10),
        tags: jsonData['tags'],
        storeId: jsonData['store_id'],
      );

  Future<void> loadStore() async =>
      store = Store.fromJson(await ShopService.getStoreById(storeId));

  toJson() => {
        'id': id,
        'price': price.toString(),
        'name': name,
        'description': description,
        'image': image,
        'stock': stock,
        'tags': tags,
        'store_id': storeId,
      };
}
