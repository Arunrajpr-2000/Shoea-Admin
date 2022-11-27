import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/model/product_model.dart';
import 'package:shoea_admin/presentation/screens/productside/add_product/add_product_screen.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/insidecategory.dart';

class CategoryList extends StatelessWidget {
  String? value;

  CategoryList({super.key});

  final namecontroller = TextEditingController();
  final nameEDitcontroller = TextEditingController();

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => AddProducts(brandName: '')),
                );
              },
              icon: const Icon(Icons.add_a_photo)),
          IconButton(
              onPressed: () {
                AddNewCategory(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Product>>(
            stream: callCollection(categoryName!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // QueryDocumentSnapshot documentSnapshot =
                    //     snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InSideCategory(
                              brandName: categoryName,
                            ),
                          ));
                        },
                        tileColor: Whitecolor,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection("category")
                                          .doc(categoryName);
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
                          categoryName.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 21, 20, 20)),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
            }),
      ),
    );
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
                                CollectionReference collectionReference =
                                    FirebaseFirestore.instance
                                        .collection("categories")
                                        .doc('all categories')
                                        .collection(categoryName!);

                                Map<String, dynamic> category = {
                                  "name": categoryName,
                                };

                                collectionReference
                                    .add(category)
                                    .whenComplete(() {
                                  log('$categoryName Created');
                                  //----------> New collection created--------->
                                  // FirebaseFirestore.instance
                                  //     .collection('categories')
                                  //     .doc('all categories')
                                  //     .collection(categoryName!)
                                  //     .doc()
                                  //     .set({});
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

  callCollection(String name) {
    return FirebaseFirestore.instance
        .collection('categories')
        .doc('all categories')
        .collection(name)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }
}
