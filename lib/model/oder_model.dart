class OrderModel {
  final bool isDelivered;
  final bool isCanceled;
  final String id;
  OrderModel({
    required this.isCanceled,
    required this.isDelivered,
    required this.id,
  });
  Map<String, dynamic> toJson() =>
      {'isDeliverd': isDelivered, 'isCanceled': isCanceled, 'id': id};

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
      isDelivered: json['isDeliverd'],
      isCanceled: json['isCanceled'],
      id: json['id']);
}
