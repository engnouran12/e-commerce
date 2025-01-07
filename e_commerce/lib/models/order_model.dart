class Order {
  final String id;
  final bool isActive;
  final double price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;
  final DateTime registered;

  Order({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  // Factory method to parse JSON into an Order object
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      isActive: json['isActive'] ?? false,
      price: double.parse(json['price'].replaceAll(RegExp(r'[^0-9.]'), '')), // Remove '$' and ',' symbols
      company: json['company'] ?? '',
      picture: json['picture'] ?? '',
      buyer: json['buyer'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      status: json['status'] ?? '',
      registered: DateTime.parse(json['registered']),
    );
  }
}
