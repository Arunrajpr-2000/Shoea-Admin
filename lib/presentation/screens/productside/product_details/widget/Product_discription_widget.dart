import 'package:flutter/material.dart';

import 'package:shoea_admin/core/constants.dart';

class ProductDiscription extends StatelessWidget {
  const ProductDiscription({Key? key, required this.productdescription})
      : super(key: key);

  final String? productdescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        'Description : ${productdescription.toString()}',
        // 'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
        style: TextStyle(
            color: Whitecolor.withOpacity(0.9),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
