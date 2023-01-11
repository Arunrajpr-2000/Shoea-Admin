// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect/multiselect.dart';
import 'package:shoea_admin/application/Bloc/EditProduct_bloc/edit_bloc_bloc.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/function/add_product_function.dart';
import 'package:shoea_admin/presentation/screens/productside/edit_product/widget/edit_image_widget.dart';

class EditProducts extends StatelessWidget {
  String? productname,
      productprice,
      productquantity,
      productdescription,
      docname;

  List productsize;

  EditProducts({
    super.key,
    required this.brandname,
    required this.productdescription,
    required this.productindeximage,
    required this.productname,
    required this.productprice,
    required this.productquantity,
    required this.docname,
    required this.productsize,
  });
  String brandname;
  // String? productindexname,
  //     productindexprice,
  //     productindexquantity,
  //     productindexdescription,
  //     productindexsize;
  final List? productindeximage;
  // Product? product;

  late final name_controller = TextEditingController(text: productname);
  // String? Size;
  late final price_controller = TextEditingController(text: productprice);
  late final description_controller =
      TextEditingController(text: productdescription);

  late final quantity_controller = TextEditingController(text: productquantity);

  List<String> productnewsizes = [];

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<EditBlocBloc>(context).add(LoadOldData(product: product!));
    final screenWidth = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Product',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          const SizedBox(
            height: 40,
          ),

          // TextfieldWidget()

          TextFormField(
            controller: name_controller,
            // initialValue: productname,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                label: Text(
                  'Name Of the Product',
                  style: TextStyle(color: Colors.white70),
                ),
                // hintText: 'Name Of the Product',
                hintStyle: TextStyle(color: Colors.white70)),
          ),

          // textfield(
          //     hint: 'Name of the Product',
          //     fieldWidth: MediaQuery.of(context).size.width * 0.9,
          //     controller: name_controller),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  controller: price_controller,
                  // initialValue: productprice,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      label: Text(
                        'Price',
                        style: TextStyle(color: Colors.white70),
                      ),
                      // hintText: 'Name Of the Product',
                      hintStyle: TextStyle(color: Colors.white70)),
                  // onChanged: (String name) {
                  //   productprice = name;
                  // },
                ),
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  controller: quantity_controller,
                  //initialValue: productquantity,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      label: Text(
                        'Quantity',
                        style: TextStyle(color: Colors.white70),
                      ),
                      // hintText: 'Name Of the Product',
                      hintStyle: TextStyle(color: Colors.white70)),
                  // onChanged: (String name) {
                  //   productquantity = name;
                  // },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: TextFormField(
              //initialValue: description_controller.text,
              controller: description_controller,
              maxLines: 5,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  label: Text(
                    'Description',
                    style: TextStyle(color: Colors.white70),
                  ),
                  // hintText: 'Name Of the Product',
                  hintStyle: TextStyle(color: Colors.white70)),
              // onChanged: (String name) {
              //   productdescription = name;
              // },
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          BlocBuilder<EditBlocBloc, EditBlocState>(
            builder: (context, state) {
              return StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: DropDownMultiSelect(
                      onChanged: (x) {
                        setState(() {
                          productsize = x;
                        });
                      },
                      options: [
                        '36',
                        '38',
                        '40',
                        '42',
                      ],
                      selectedValues: productsize.cast(),
                      whenEmpty: 'Select Size',
                    ),
                  );
                },
              );
            },
          ),

          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20),
          //   child: BlocBuilder<EditBlocBloc, EditBlocEvent>(
          //     builder: (context, state) {
          //       return DropdownButton<String>(
          //         focusColor: Colors.red,
          //         iconEnabledColor: Colors.red,
          //         dropdownColor: Whitecolor,
          //         items: <String>[
          //           '38',
          //           '40',
          //           '42',
          //         ].map((String value) {
          //           return DropdownMenuItem<String>(
          //             value: value,
          //             child: Text(
          //               value,
          //             ),
          //           );
          //         }).toList(),
          //         onChanged: (value) {
          //           productsize = value;

          //           // BlocProvider.of<AddProductBloc>(context)
          //           //     .add(Sizes(Size: Size ?? 'size'));
          //         },
          //         hint: const Text(
          //           'Size',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),

          k20Height,

          EditImageWidget(
            productImage: productindeximage,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // BlocBuilder<EditBlocBloc, EditBlocState>(
              //   builder: (context, state) {
              //     return

              ElevatedButton(
                onPressed: () async {
                  // log('message$brandname');
                  // DocumentReference documentReference = FirebaseFirestore
                  //     .instance
                  //     .collection("categories")
                  //     .doc(brandname)
                  //     .collection(brandname)
                  //     .doc(productname);

                  // DocumentReference allprodEdit = FirebaseFirestore.instance
                  //     .collection("all")
                  //     .doc(productname);

                  // // var productsize;
                  // Map<String, dynamic> category = {
                  //   "name": name_controller.text,
                  //   'docname': name_controller.text,
                  //   'price': double.parse(price_controller.text),
                  //   'quantity': int.parse(price_controller.text),
                  //   'description': description_controller.text,
                  //   'size': productsize,
                  //   'image': productindeximage
                  // };
                  // log(name_controller.text);
                  // log(price_controller.text);

                  // log(productquantity.toString());

                  // log(productdescription.toString());

                  // log(productsize.toString());

                  // log(productindeximage.toString());
                  // log('message cate ');

                  // await documentReference.update(category).whenComplete(() {
                  //   allprodEdit.update(category);
                  // });

                  updateProduct(
                    name: name_controller.text.trim().isEmpty
                        ? productname.toString()
                        : name_controller.text.trim(),
                    description: description_controller.text.trim().isEmpty
                        ? productdescription.toString()
                        : description_controller.text.trim(),
                    price: price_controller.text.trim().isEmpty
                        ? productprice.toString()
                        : price_controller.text.trim(),
                    quantity: quantity_controller.text.trim().isEmpty
                        ? productquantity.toString()
                        : quantity_controller.text.trim(),
                    docName: docname.toString(),
                    size: productsize,
                    images: productindeximage!,
                    categoryName: brandname,
                  );

                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.red,

                  textStyle: const TextStyle(fontSize: 20),
                  //backgroundColor: Colors.green
                ),
                child: const Text('  Edit  '),
                //   );
                // },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }

  productAddedAlert(BuildContext context, String name) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      content: Text("$name added to database."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
