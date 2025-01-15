import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Product {
  final int id;
  final double price;
  final String name;
  final String description;
  final int stock;
  final List tags;
  final int storeId;
  String image;
  Store? store;
  String? arabicName;
  String? englishName;
  String? arabicDescription;
  String? englishDescription;

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
    this.arabicName,
    this.englishName,
    this.arabicDescription,
    this.englishDescription,
  });

  factory Product.fromJson(jsonData) {
    return Product(
      id: jsonData['id'],
      price: double.parse(jsonData['price'].toString()),
      name: jsonData['translations'][AppHelper.currentLang]['name'] ?? '',
      description:
          jsonData['translations'][AppHelper.currentLang]['description'] ?? '',
      image: jsonData['icon_url'] ?? AppImages.productImage,
      stock: int.parse(jsonData['stock'].toString()),
      tags: jsonData['tags'],
      storeId: jsonData['store_id'],
      arabicName: jsonData['translations']?['ar']?['name'] ??
          'لا يوجد اسم متوفر باللغة العربية..',
      englishName: jsonData['translations']?['en']?['name'] ??
          'No Name Provided in English..',
      arabicDescription: jsonData['translations']?['ar']?['description'] ??
          'لا يوجد وصف متوفر باللغة العربية..',
      englishDescription: jsonData['translations']?['en']?['description'] ??
          'No Descreption Provided in English..',
    );
  }

  Future<void> loadStore() async =>
      store = Store.fromJson(await ShopService.getStoreById(storeId));

  toJson() => {
        'id': id,
        'price': price.toString(),
        'translations': {
          'en': {
            'name': englishName,
            'description': englishDescription,
          },
          'ar': {
            'name': arabicName,
            'description': arabicDescription,
          },
        },
        'icon_url': image,
        'stock': stock,
        'tags': tags,
        'store_id': storeId,
      };
}
