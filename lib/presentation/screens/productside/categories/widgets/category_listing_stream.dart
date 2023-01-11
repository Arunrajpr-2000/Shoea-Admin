import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/widgets/category_listview.dart';

class CategoryListStream extends StatelessWidget {
  const CategoryListStream({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CategoryListView(
              categoryName: categoryName,
              snapshot: snapshot,
            );
          } else {
            return const Align(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        });
  }
}
