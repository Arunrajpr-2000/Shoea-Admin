import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:shoea_admin/presentation/screens/productside/add_product/add_product_screen.dart';
import 'package:shoea_admin/presentation/screens/productside/edit_product/edit_product.dart';
import 'package:shoea_admin/presentation/screens/productside/product_details/product_View.dart';

class InSideCategory extends StatelessWidget {
  InSideCategory({required this.brandName, super.key});

  String brandName;

  final List<String>? Cartimage = [
    'https://rukminim1.flixcart.com/image/832/832/l58iaa80/shoe/9/y/q/-original-imagfyaseenuzn6d.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/4/j/1/6-nikefecion-6-nnikhe-blue-original-imaggxz9wf5s7q3d.jpeg?q=70',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(brandName.toString()),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddProducts(brandName: brandName),
            )),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(.1),
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            )),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('categories')
              .doc(brandName)
              .collection(brandName)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                // separatorBuilder: (context, index) => SizedBox(
                //   height: 20,
                // ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductView(
                          productname: documentSnapshot['name'].toString(),
                          productdescription:
                              documentSnapshot['description'].toString(),
                          productprice: documentSnapshot['price'].toString(),
                          productquantiy:
                              documentSnapshot['quantity'].toString(),
                          productsize: documentSnapshot['size'].toString(),
                          productimage: documentSnapshot['image'],
                        ),
                      )),
                      tileColor: Colors.white,
                      leading: Container(
                        clipBehavior: Clip.none,
                        width: 70,
                        height: 70,

                        // radius: 40,
                        // backgroundImage: NetworkImage(''),
                        child: documentSnapshot['image'] == null
                            ? Image.network('${Cartimage![0]}')
                            : Image.network(
                                documentSnapshot['image'][0],
                                fit: BoxFit.cover,
                              ),
                      ),
                      title: Text(
                        documentSnapshot['name'],
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        documentSnapshot['price'].toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => editProduct())),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                DocumentReference documentReference =
                                    FirebaseFirestore.instance
                                        .collection("category")
                                        .doc(brandName)
                                        .collection('categoryproduct')
                                        .doc(documentSnapshot['name']);
                                documentReference.delete().whenComplete(() =>
                                    log('${documentSnapshot['name']} Deleted'));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ))
                        ],
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
          }),
    );
  }
}
