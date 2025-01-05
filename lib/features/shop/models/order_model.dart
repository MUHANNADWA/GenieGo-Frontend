class Order {
  final int id;
  final double totalPrice;
  final String status;
  final List products;
  final String createdAt;

  Order({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.products,
    required this.createdAt,
  });

  toJson() {
    return {
      'id': id,
      'totalPrice': totalPrice,
      'status': status,
      'products': products,
      'createdAt': createdAt,
    };
  }

  factory Order.fromJson(jsonData) {
    return Order(
      id: jsonData['id'],
      totalPrice: double.parse(jsonData['total_price']),
      status: jsonData['status'],
      products: jsonData['products'],
      createdAt: jsonData['created_at'],
    );
  }

  @override
  String toString() =>
      'Order(id: $id, totalPrice: $totalPrice, status: $status, products: $products, products: $createdAt)';
}
