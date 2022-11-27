import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoea_admin/model/product_model.dart';

Future addProduct({
  required String size,
  required String name,
  required String docName,
  required String description,
  String price = '1',
  String quantity = '1',
  required String categoryName,
  required List images,
}) async {
  // final docProduct = FirebaseFirestore.instance
  //     .collection('categories')
  //     .doc(name)
  //     .collection(name)
  //     .doc();
  log('adding product to $name');
  final Product product = Product(
    docName: docName,
    size: size,
    name: name,
    description: description,
    price: double.parse(price),
    quantity: double.parse(quantity),
    images: images,
  );
  final json = product.toJson();
  log('befre adding');
  log('Docname ${docName}');
  log('Prod name ${product.name}');
  log('product ${product.docName}');

  final allProduc = FirebaseFirestore.instance
      .collection('categories')
      .doc(categoryName)
      .collection(categoryName)
      .doc(product.docName);
  // await docProduct.set(json);
  await allProduc.set(json);

  log('added');
}
