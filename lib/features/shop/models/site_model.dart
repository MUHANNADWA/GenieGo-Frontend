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
