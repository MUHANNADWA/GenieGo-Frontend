class Store {
  final String id;
  final String siteId;

  Store({
    required this.id,
    required this.siteId,
  });

  factory Store.fromJson(jsonData) {
    return Store(
      id: jsonData['id'],
      siteId: jsonData['site_id'],
    );
  }

  toJson() {
    return {
      'siteId': siteId,
    };
  }
}
