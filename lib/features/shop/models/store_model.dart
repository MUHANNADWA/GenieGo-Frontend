import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Store {
  final int id;
  final String name;
  final String description;
  final Site site;
  final String image;
  final List tags;

  Store({
    required this.id,
    required this.name,
    required this.description,
    required this.site,
    required this.image,
    required this.tags,
  });

  factory Store.fromJson(jsonData) {
    return Store(
      id: jsonData['id'],
      site: Site.fromJson(jsonData['site']),
      tags: jsonData['tags'],
      image: jsonData['icon_url'],
      name: jsonData['translations'][AppHelper.currentLang.substring(0, 2)]
          ['name'],
      description: jsonData['translations']
          [AppHelper.currentLang.substring(0, 2)]['description'],
    );
  }

  toJson() {
    return {
      'id': id,
      'site': site,
      'tags': tags,
      'image': image,
      'name': name,
      'description': description,
    };
  }
}