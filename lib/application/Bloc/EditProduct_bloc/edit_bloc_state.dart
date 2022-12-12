part of 'edit_bloc_bloc.dart';

@immutable
class EditBlocState {
  EditBlocState({required this.product});

  Product product;
}

class EditBlocInitial extends EditBlocState {
  EditBlocInitial()
      : super(
          product: Product(
            name: '',
            description: '',
            price: 0,
            quantity: 0,
            images: [],
            docName: '',
            size: [],
          ),
        );
}
