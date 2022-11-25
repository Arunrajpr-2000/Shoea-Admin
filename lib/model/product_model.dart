class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final double quantity;

  final List images;
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.images,
      required this.category});
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity,
        'images': images,
        'category': category,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        name: json['name'],
        id: json['id'],
        description: json['description'],
        price: json['price'],
        quantity: json['quantity'],
        images: json['images'],
        category: json['category'],
      );
}
