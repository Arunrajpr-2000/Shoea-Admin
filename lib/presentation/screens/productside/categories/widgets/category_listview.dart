import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/model/product_model.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/insidecategory.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({
    Key? key,
    required this.categoryName,
    required this.snapshot,
  }) : super(key: key);

  final String? categoryName;
  final dynamic snapshot;
  // Product product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        QueryDocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
        String id = snapshot.data!.docs[index].id;
        log(id);

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
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      DeleteFunction(context, documentSnapshot);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
            title: Text(
              documentSnapshot['name'],
              // categoryName,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 21, 20, 20)),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> DeleteFunction(
      BuildContext context, QueryDocumentSnapshot<Object?> documentSnapshot) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Do you want to delete'),
          content: const Text('It will be deleted from your Firebase'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                DocumentReference documentReference = FirebaseFirestore.instance
                    .collection("categories")
                    .doc(documentSnapshot['name']);
                documentReference
                    .delete()
                    .whenComplete(() => log('$categoryName Deleted'));

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    "Deleted Successfully",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: const Color(0xffdd0021),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ));

                // setState(() {
                //   playlists = box.keys
                //       .toList();
                // });
                Navigator.pop(context);
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Color(0xffdd0021),
                ),
              ),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                    color: Color(0xffdd0021), fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }
}
