// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect/multiselect.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/presentation/screens/productside/add_product/widgets/add_images_widget.dart';
import 'package:shoea_admin/presentation/screens/productside/add_product/widgets/textfield_widget.dart';

import '../../../../application/Bloc/Addproduct_bloc/add_product_bloc.dart';

class AddProducts extends StatelessWidget {
  String? productname,
      productprice,
      productquantity,
      productdescription,
      productimage;

  AddProducts({super.key, required this.brandName});
  final String? brandName;
  // ignore: non_constant_identifier_names
  TextEditingController name_controller = TextEditingController();
  // String? Size;
  TextEditingController price_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();

  TextEditingController quantity_controller = TextEditingController();

  List<String> Productsize = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Add New Product',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          const SizedBox(
            height: 40,
          ),
          TextfieldWidget(
              controller: name_controller,
              productField: productname,
              labelName: 'Name of the Product'),
          k20Height,
          priceQuantityTextfield(),
          k20Height,
          SizedBox(
            width: 200,
            height: 80,
            child: TextfieldWidget(
                controller: description_controller,
                productField: productdescription,
                labelName: 'Description'),
          ),
          // k20Height,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: BlocBuilder<AddProductBloc, AddProductState>(
              builder: (context, state) {
                return StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: DropDownMultiSelect(
                        onChanged: (List<String> x) {
                          setState(() {
                            Productsize = x;
                          });
                        },
                        options: const [
                          '36',
                          '38',
                          '40',
                          '42',
                        ],
                        selectedValues: Productsize,
                        whenEmpty: 'Select Size',
                      ),
                    );
                  },
                );

                //  DropdownButton<String>(
                //   focusColor: Colors.red,
                //   iconEnabledColor: Colors.red,
                //   dropdownColor: Whitecolor,
                //   items: <String>[
                //     '38',
                //     '40',
                //     '42',
                //   ].map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value,
                //       ),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     productsize = value;
                //   },
                //   hint: const Text(
                //     'Size',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // );
              },
            ),
          ),
          k30Height,
          AddImageWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // DocumentReference documentReference = FirebaseFirestore
                  //     .instance
                  //     .collection("category")
                  //     .doc(brandName)
                  //     .collection('categoryproduct')
                  //     .doc(productname);

                  //var productsize;
                  // Map<String, dynamic> category = {
                  //   "name": productname,
                  //   'price': productprice,
                  //   'quantity': productquantity,
                  //   'description': productdescription,
                  //   'size': productsize,
                  //   'image': productimage
                  // };

                  // documentReference
                  //     .set(category)
                  //     .whenComplete(() => log('$productname Created'));
                  BlocProvider.of<AddProductBloc>(context).add(SaveToDB(
                      categoryName: brandName.toString(),
                      name_controller: name_controller.text,
                      description_controller: description_controller.text,
                      price_controller: double.parse(price_controller.text),
                      quantity_controller: int.parse(quantity_controller.text),
                      Size: Productsize.toList(),
                      docName: name_controller.text));

                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.red,

                  textStyle: const TextStyle(fontSize: 20),
                  //backgroundColor: Colors.green
                ),
                child: const Text('  ADD  '),
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

  Row priceQuantityTextfield() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 150,
          child: TextfieldWidget(
              controller: price_controller,
              productField: productprice,
              keyboardType: TextInputType.number,
              labelName: 'Price'),
        ),
        SizedBox(
          width: 150,
          child: TextfieldWidget(
              controller: quantity_controller,
              productField: productquantity,
              keyboardType: TextInputType.number,
              labelName: 'Qunatity'),
        ),
      ],
    );
  }
}
