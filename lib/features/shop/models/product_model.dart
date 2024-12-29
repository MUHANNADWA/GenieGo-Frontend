import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Product {
  final int id;
  final Store store;
  final String name;
  final String description;
  final double price;
  final String image;
  final List tags;

  Product({
    required this.store,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.tags,
  });

  factory Product.fromJson(jsonData) {
    return Product(
      id: jsonData['id'],
      store: Store.fromJson(jsonData['store']),
      name: jsonData['translations'][AppHelper.currentLang.substring(0, 2)]
          ['name'],
      description: jsonData['translations']
          [AppHelper.currentLang.substring(0, 2)]['description'],
      price: jsonData['price'].toDouble(),
      image: jsonData['icon_url'] ?? AppImages.appLogo,
      tags: jsonData['tags'],
    );
  }

  toJson() {
    return {
      'id': id,
      'store': store,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'tags': tags,
    };
  }
}
