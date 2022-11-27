part of 'add_product_bloc.dart';

@immutable
class AddProductState {
  String title;
  String description;

  double price;
  double quantity;

  List images;
  String categoryName;
  String Size;

  AddProductState({
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.images,
    required this.Size,
    required this.categoryName,
  });
}

class InitialState extends AddProductState {
  InitialState()
      : super(
            categoryName: '',
            title: '',
            description: '',
            price: 0,
            quantity: 0,
            images: [],
            Size: '');
}
