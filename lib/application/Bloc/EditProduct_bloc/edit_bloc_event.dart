part of 'edit_bloc_bloc.dart';

@immutable
abstract class EditBlocEvent {}

class LoadOldData extends EditBlocEvent {
  LoadOldData({required this.product});
  Product product;
}

class UnSelectImage extends EditBlocEvent {
  UnSelectImage({required this.imgUrl});
  final String imgUrl;
}

class SelectImage extends EditBlocEvent {}

class UpdateNewData extends EditBlocEvent {
  UpdateNewData({
    required this.categoryName,
    required this.docName,
    required this.name_controller,
    required this.description_controller,
    required this.Size,
    required this.price_controller,
    required this.quantity_controller,
    required this.product,
  });
  final Product product;

  final String categoryName;
  final List Size;
  final String docName;
  final String name_controller;
  final String description_controller;

  final String price_controller;
  final String quantity_controller;
}
