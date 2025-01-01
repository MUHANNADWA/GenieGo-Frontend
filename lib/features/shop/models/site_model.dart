class Site {
  final int id;
  final String name;
  final String address;

  Site({
    required this.id,
    required this.name,
    required this.address,
  });

  factory Site.fromJson(jsonData) => Site(
        id: jsonData['id'],
        name: jsonData['name'],
        address: jsonData['address'],
      );

  toJson() => {
        'id': id,
        'name': name,
        'address': address,
      };

  @override
  String toString() => 'Site(id: $id, name: $name, address: $address)';
}
