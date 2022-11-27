import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shoea_admin/function/image_function.dart';

import '../../../function/add_product_function.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(InitialState()) {
    on<AddProductEvent>((event, emit) {});

    on<SelectImage>((event, emit) async {
      final imageUrl = await ImageFunctions.getImage();
      // if (imageUrl != null) {}
      List newImgList = ImageFunctions.addImage(state.images, imageUrl!);
      emit(AddProductState(
          categoryName: state.categoryName,
          title: state.title,
          description: state.description,
          price: state.price,
          quantity: state.quantity,
          images: newImgList,
          Size: state.Size));
    });
    on<UnSelectImage>((event, emit) {
      List newList = state.images;
      newList.remove(event.imgUrl);
      log('img removed from state');
      emit(AddProductState(
          categoryName: state.categoryName,
          title: state.title,
          description: state.description,
          price: state.price,
          quantity: state.quantity,
          images: newList,
          Size: state.Size));
    });
    on<SaveToDB>((event, emit) {
      log(' event called');

      addProduct(
        categoryName: event.categoryName,
        name: event.name_controller,
        description: event.description_controller,
        price: event.price_controller.isEmpty ? '0' : event.price_controller,
        quantity:
            event.quantity_controller.isEmpty ? '0' : event.quantity_controller,
        images: state.images,
        size: event.Size,
      );
      emit(state);
    });
    // on<Sizes>((event, emit) {
    //   emit(AddProductState(
    //       title: state.title,
    //       description: state.description,
    //       price: state.price,
    //       quantity: state.quantity,
    //       images: state.images,
    //       Size: event.Size));
    // });
  }
}
