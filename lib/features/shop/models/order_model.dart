import 'package:geniego/features/shop/models/site_model.dart';

class Order {
  final int id;
  final double totalPrice;
  final String status;
  final List products;
  final Site site;
  final String createdAt;

  Order({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.products,
    required this.site,
    required this.createdAt,
  });

  toJson() {
    return {
      'id': id,
      'totalPrice': totalPrice,
      'status': status,
      'products': products,
      'site': site,
      'created_at': createdAt,
    };
  }

  factory Order.fromJson(jsonData) {
    return Order(
      id: jsonData['id'],
      totalPrice: double.parse(jsonData['total_price']),
      status: jsonData['status'],
      products: jsonData['products'],
      site: Site.fromJson(jsonData['site']),
      createdAt: jsonData['created_at'],
    );
  }

  @override
  String toString() =>
      'Order(id: $id, totalPrice: $totalPrice, status: $status, products: $products, createdAt: $createdAt, site: $site)';
}
