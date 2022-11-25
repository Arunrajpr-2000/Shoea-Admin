import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/insidecategory.dart';

import 'package:firebase_core/firebase_core.dart';

class CategoryList extends StatelessWidget {
  String? value;

  CategoryList({super.key});

  final namecontroller = TextEditingController();
  final nameEDitcontroller = TextEditingController();
  String? Name;

  String? categoryName;
  String? categoryProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Categories'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  AddNewCategory(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('category')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InSideCategory(
                                  brandName: documentSnapshot['name'],
                                ),
                              ));
                            },
                            tileColor: Whitecolor,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      DocumentReference documentReference =
                                          FirebaseFirestore.instance
                                              .collection("category")
                                              .doc(documentSnapshot['name']);
                                      documentReference.delete().whenComplete(
                                          () => log('$categoryName Deleted'));
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                            title: Text(
                              documentSnapshot['name'],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 21, 20, 20)),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }
                })));
  }

  Future<dynamic> AddNewCategory(BuildContext context) {
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
                      controller: namecontroller,
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
                                  primary: Color(0xffdd0021),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                DocumentReference documentReference =
                                    FirebaseFirestore.instance
                                        .collection("category")
                                        .doc(categoryName);

                                Map<String, dynamic> category = {
                                  "name": categoryName,
                                };

                                documentReference
                                    .set(category)
                                    .whenComplete(() {
                                  log('$categoryName Created');
                                  //----------> New collection created--------->
                                  FirebaseFirestore.instance
                                      .collection('category')
                                      .doc(categoryName)
                                      .collection('categoryproduct')
                                      .doc()
                                      .set({});
                                  //     .then((_) {
                                  //   print("collection created");
                                  // });
                                });

                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Create',
                                style: TextStyle(color: Colors.white),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffdd0021),
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
}
