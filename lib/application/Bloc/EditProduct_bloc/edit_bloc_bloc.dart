import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoea_admin/function/image_function.dart';
import 'package:shoea_admin/model/product_model.dart';

import '../../../function/add_product_function.dart';

part 'edit_bloc_event.dart';
part 'edit_bloc_state.dart';

class EditBlocBloc extends Bloc<EditBlocEvent, EditBlocState> {
  EditBlocBloc() : super(EditBlocInitial()) {
    on<EditBlocEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadOldData>((event, emit) {
      emit(EditBlocState(
        product: Product(
          name: event.product.name,
          description: event.product.description,
          price: event.product.price,
          quantity: event.product.quantity,
          docName: event.product.docName,
          images: event.product.images,
          size: state.product.size,
        ),
      ));
    });

    on<SelectImage>((event, emit) async {
      final imageUrl = await ImageFunctions.getImage();
      // if (imageUrl != null) {}
      log("${imageUrl}");
      List _newImgList =
          ImageFunctions.addImage(state.product.images, imageUrl!);
      emit(
        EditBlocState(
          product: Product(
            docName: state.product.docName,
            images: _newImgList,
            name: state.product.name,
            description: state.product.description,
            quantity: state.product.quantity,
            size: state.product.size,
            price: state.product.price,
          ),
        ),
      );
      on<UnSelectImage>((event, emit) {
        List newList = state.product.images;
        newList.remove(event.imgUrl);
        log('img removed from state');
        emit(EditBlocState(
          product: Product(
            name: state.product.name,
            description: state.product.description,
            docName: state.product.docName,
            size: state.product.size,
            price: state.product.price,
            quantity: state.product.quantity,
            images: newList,
          ),
        ));
      });
      on<UpdateNewData>((event, emit) {
        log('Update event called');

        updateProduct(
          categoryName: event.categoryName,
          docName: event.docName,
          size: state.product.size,
          name: event.name_controller,
          description: event.description_controller,
          price: event.price_controller,
          quantity: event.quantity_controller,
          images: state.product.images,
        );
        emit(EditBlocState(
          product: Product(
              name: state.product.name,
              description: state.product.description,
              price: state.product.price,
              quantity: state.product.quantity,
              images: state.product.images,
              docName: state.product.docName,
              size: state.product.size),
        ));
      });
    });
  }
}
