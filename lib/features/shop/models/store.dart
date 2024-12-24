import 'package:geniego/features/shop/models/site.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class Store {
  final int id;
  final String name;
  final String description;
  final Site site;
  final String image;
  final List tags;

  Store({
    required this.tags,
    required this.image,
    required this.name,
    required this.description,
    required this.id,
    required this.site,
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
