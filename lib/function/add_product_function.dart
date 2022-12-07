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

//

updateProduct({
  required Product product,
  required final context,
  required String size,
  required String name,
  required String description,
  required String categoryName,
  required String docName,
  required String price,
  String quantity = '0',
  required List images,
}) async {
  log(name);
  final docProduct = FirebaseFirestore.instance
      .collection('categories')
      .doc(categoryName)
      .collection(categoryName)
      .doc(product.docName);
  // await UpdateProductFunctions.updateProduct(
  //   name: event.name_controller.trim().isEmpty
  //       ? state.product.name
  //       : event.name_controller,
  //   description: event.description_controller.trim().isEmpty
  //       ? state.product.description
  //       : event.description_controller,
  //   spec: event.spec_controller.trim() == ''
  //       ? state.product.spec
  //       : event.spec_controller,
  //   price: event.price_controller.trim() == ''
  //       ? '${state.product.price}'
  //       : event.price_controller,
  //   quantity: event.quantity_controller.trim() == ''
  //       ? '${state.product.quantity}'
  //       : event.quantity_controller,
  //   rating: event.rating_controller.trim() == ''
  //       ? '${state.product.rating}'
  //       : event.rating_controller,
  //   colors: state.product.colors,
  //   images: state.product.images,
  //   id: event.id,
  //   context: event.context,
  // );
  final Product updatedProduct = Product(
    size: size,
    docName: docName,
    name: name,
    description: description,
    price: price == '0' ? product.price : double.parse(price),
    quantity: quantity == '0' ? product.quantity : double.parse(quantity),
    images: images,
  );
  // log('Updating.... ${product.id}');

  final json = updatedProduct.toJson();
  final allproducts = FirebaseFirestore.instance
      .collection('categories')
      .doc(categoryName)
      .collection(categoryName)
      .doc(product.docName);
  await docProduct.set(json);
  await allproducts.set(json);

  // productUpdatedAlert(context, updatedProduct.name);
  // log('Updated ${product.name}');
}

  // static productUpdatedAlert(BuildContext context, String name) {
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Text("OK"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //       Navigator.pop(context);
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     backgroundColor: Colors.white,
  //     content: Text(
  //       "$name updated.",
  //       style: TextStyle(fontSize: 20),
  //     ),
  //     actions: [
  //       okButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }