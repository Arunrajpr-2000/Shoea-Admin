class Product {
  final String name;
  final String description;
  final double price;
  final List size;
  final String docName;

  final int quantity;
  final List images;
  Product({
    required this.size,
    required this.docName,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.images,
  });
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity,
        'image': images,
        'size': size,
        'docname': docName
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      images: json['image'],
      size: json['size'],
      docName: json['docname']);
}
