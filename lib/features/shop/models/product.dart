import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Product {
  final int id;
  final int storeId;
  final String name;
  final String description;
  final double price;
  final String image;
  final List tags;

  Product({
    required this.storeId,
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
      storeId: jsonData['store_id'],
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
      'storeId': storeId,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'tags': tags,
    };
  }
}
