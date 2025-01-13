import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Store {
  final int id;
  final String name;
  final String description;
  final Site site;
  final List tags;
  String image;

  Store({
    required this.id,
    required this.name,
    required this.description,
    required this.site,
    required this.image,
    required this.tags,
  });

  factory Store.fromJson(jsonData) => Store(
        id: jsonData['id'],
        site: jsonData?['site'] ?? AppHelper.exampleSite,
        tags: jsonData['tags'],
        image: jsonData['icon_url'] ?? AppImages.appLogo,
        name: jsonData['translations'][AppHelper.currentLang]['name'],
        description: jsonData['translations'][AppHelper.currentLang]
                ['description'] ??
            '',
      );

  toJson() => {
        'id': id,
        'site': site,
        'tags': tags,
        'image': image,
        'name': name,
        'description': description,
      };
}
