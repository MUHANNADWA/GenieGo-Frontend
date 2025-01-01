import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Product {
  final int id;
  final int storeId;
  final double price;
  final String name;
  final String description;
  final String image;
  final List tags;

  Product({
    required this.id,
    required this.storeId,
    required this.price,
    required this.name,
    required this.description,
    required this.image,
    required this.tags,
  });

  factory Product.fromJson(jsonData) {
    return Product(
      id: jsonData['id'],
      storeId: jsonData['store_id'],
      price: double.parse(jsonData['price']),
      name: jsonData['translations'][AppHelper.currentLang]['name'],
      description: jsonData['translations'][AppHelper.currentLang]
          ['description'],
      image: jsonData['icon_url'] ?? AppImages.productImage,
      tags: jsonData['tags'],
    );
  }

  toJson() {
    return {
      'id': id,
      'storeId': storeId,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'tags': tags,
    };
  }
}
