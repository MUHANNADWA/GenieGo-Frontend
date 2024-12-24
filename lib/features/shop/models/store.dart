import 'package:geniego/utils/helpers/helper_functions.dart';

class Store {
  final int id;
  final Site site;
  final List tags;
  final String? image;
  final String name;
  final String description;

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

class Site {
  final int id;
  final String name;
  final String address;

  Site({
    required this.id,
    required this.name,
    required this.address,
  });

  toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }

  factory Site.fromJson(jsonData) {
    return Site(
      id: jsonData['id'],
      name: jsonData['name'],
      address: jsonData['address'],
    );
  }

  @override
  String toString() => 'Site(id: $id, name: $name, address: $address)';
}
