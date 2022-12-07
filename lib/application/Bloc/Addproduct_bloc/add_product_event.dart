part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class SelectImage extends AddProductEvent {}

class UnSelectImage extends AddProductEvent {
  UnSelectImage({required this.imgUrl});
  final String imgUrl;
}

class SaveToDB extends AddProductEvent {
  SaveToDB({
    required this.Size,
    required this.categoryName,
    required this.name_controller,
    required this.description_controller,
    required this.price_controller,
    required this.quantity_controller,
    required this.docName,
  });
  final String categoryName;
  final String Size;
  final String docName;
  final String name_controller;
  final String description_controller;

  final String price_controller;
  final String quantity_controller;
}
