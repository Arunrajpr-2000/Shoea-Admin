import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';

class ProductNamePrice extends StatelessWidget {
  const ProductNamePrice({
    Key? key,
    required this.productname,
    required this.productprice,
  }) : super(key: key);

  final String? productname;
  final String? productprice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Product Name : ${productname.toString()}',
            style: const TextStyle(
                color: Whitecolor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        k20Height,
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Price : ₹ ${productprice}',
            style: TextStyle(
                color: Whitecolor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
