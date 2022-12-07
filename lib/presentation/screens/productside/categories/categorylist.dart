import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/insidecategory.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/widgets/add_new_category.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/widgets/category_listing_stream.dart';

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
                AddNewCategory(context, categoryName, namecontroller);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: CategoryListStream(categoryName: categoryName),
      ),
    );
  }
}
