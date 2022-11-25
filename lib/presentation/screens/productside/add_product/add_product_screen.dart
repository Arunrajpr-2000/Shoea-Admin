import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';

import 'package:shoea_admin/presentation/screens/productside/add_product/widgets/text_fields_widget.dart';
import 'package:shoea_admin/presentation/screens/productside/add_product/widgets/add_varients_widget.dart';

class AddProducts extends StatelessWidget {
  String? productname,
      productprice,
      productquantity,
      productdescription,
      productsize;

  AddProducts({super.key, required this.brandName});
  final String? brandName;
  final name_controller = TextEditingController();
  String? catogory;
  final price_controller = TextEditingController();
  final description_controller = TextEditingController();
  final altPrice_controller = TextEditingController();
  final spec_controller = TextEditingController();
  final quantity_controller = TextEditingController();
  final rating_controller = TextEditingController();
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
          TextFormField(
            controller: name_controller,
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
            onChanged: (String name) {
              productname = name;
            },
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
                  onChanged: (String name) {
                    productprice = name;
                  },
                ),
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  controller: quantity_controller,
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
                  onChanged: (String name) {
                    productquantity = name;
                  },
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
              onChanged: (String name) {
                productdescription = name;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButton<String>(
              focusColor: Colors.red,
              iconEnabledColor: Colors.red,
              dropdownColor: Whitecolor,
              items: <String>[
                '38',
                '40',
                '42',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                productsize = value;
              },
              hint: const Text(
                'Size',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //AddVarientsWidget(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  DocumentReference documentReference = FirebaseFirestore
                      .instance
                      .collection("category")
                      .doc(brandName)
                      .collection('categoryproduct')
                      .doc(productname);

                  //var productsize;
                  Map<String, dynamic> category = {
                    "name": productname,
                    'price': productprice,
                    'quantity': productquantity,
                    'description': productdescription,
                    'size': productsize,
                  };

                  documentReference
                      .set(category)
                      .whenComplete(() => log('$productname Created'));

                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
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