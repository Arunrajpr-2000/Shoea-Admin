import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';

Future<dynamic> AddNewCategory(BuildContext context, controller, categoryName) {
  final controller = TextEditingController();

  String? categoryName;

  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Whitecolor,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
              width: 300,
              height: 150,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    style: const TextStyle(
                      color: Color(0xff2b2b29),
                    ),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Blackcolor, width: 2),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      hintText: 'Add New Category',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff2b2b29),
                          width: 2.0,
                        ),
                      ),
                    ),
                    onChanged: (String name) {
                      categoryName = name;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffdd0021),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              //<----------Documet BrandName Creation---
                              DocumentReference documentReference =
                                  FirebaseFirestore.instance
                                      .collection("categories")
                                      .doc(categoryName);

                              Map<String, dynamic> category = {
                                "name": categoryName,
                                // 'desciption': ''
                                //     'size',
                                // "image": [],
                                // "price": '',
                                // "quantity": '',
                              };

                              documentReference.set(category).whenComplete(() {
                                log('$categoryName Created');
                              });

                              //<-------Inside document collection creating with Same Brand Name----

                              CollectionReference collectionReference =
                                  FirebaseFirestore.instance
                                      .collection("categories")
                                      .doc(categoryName)
                                      .collection(
                                          categoryName ?? 'categoryName');

                              Map<String, dynamic> categoryfield = {
                                "name": categoryName,
                                'desciption': 'Description of product',
                                'size': 'size of product',
                                "image": [
                                  'https://rukminim1.flixcart.com/image/832/832/kyt0ya80/shoe/p/g/1/10-bbmh9023-bacca-bucci-grey-original-imagayu2837tmzjq.jpeg?q=70',
                                ],
                                "price": 'Price of product',
                                "quantity": 'Quantity of product',
                                "docname": 'Name of doc'
                              };

                              collectionReference
                                  .add(categoryfield)
                                  .whenComplete(() {
                                log('$categoryName Created');
                              });

                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Create',
                              style: TextStyle(color: Colors.white),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffdd0021),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
