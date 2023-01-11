import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoea_admin/model/oder_model.dart';

Future acceptrejectOrder(
    {required OrderModel orderModel, required String email}) async {
  final userdoc = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('order')
      .doc(orderModel.id);

  final json = orderModel.toJson();

  await userdoc.update(json);
}

// Future rejectorder(
//     {required OrderModel orderModel, required String email}) async {
//   final docProduct = FirebaseFirestore.instance
//       .collection('users')
//       .doc(email)
//       .collection('order')
//       .doc(orderModel.id);
//   final json = orderModel.toJson();

//   await docProduct.update(json);
// }
