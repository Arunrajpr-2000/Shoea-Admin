import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoea_admin/model/product_model.dart';

Future addProduct({
  required List size,
  required String name,
  required String docName,
  required String description,
  required double price,
  required int quantity,
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
    price: price,
    quantity: quantity,
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

// edit product.....................

updateProduct({
  required List size,
  required String name,
  required String description,
  required String categoryName,
  required String docName,
  required String price,
  required String quantity,
  required List images,
}) async {
  log(name);
  log(size[0].toString());

  log(description);
  log(categoryName);
  log(docName);
  log(price);
  log(quantity);

  final docProduct = FirebaseFirestore.instance
      .collection('categories')
      .doc(categoryName)
      .collection(categoryName)
      .doc(docName);

  final Product updatedProduct = Product(
    size: size,
    docName: docName,
    name: name,
    description: description,
    price: double.parse(price),
    quantity: int.parse(quantity),
    images: images,
  );
  // log('Updating.... ${product.id}');

  final json = updatedProduct.toJson();
  final allproducts = FirebaseFirestore.instance
      .collection('categories')
      .doc(categoryName)
      .collection(categoryName)
      .doc(docName);
  //await docProduct.set(json);
  await allproducts.update(json);
}
