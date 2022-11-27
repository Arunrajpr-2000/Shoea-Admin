import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';

import 'widget/Product_Name_Price_Cart.dart';
import 'widget/Product_discription_widget.dart';
import 'widget/pageView_container.dart';

class ProductView extends StatelessWidget {
  ProductView(
      {Key? key,
      required this.productname,
      required this.productprice,
      required this.productdescription,
      required this.productquantiy,
      required this.productsize,
      required this.productimage})
      : super(key: key);

  final String? productname;
  final String? productprice;
  final List? productimage;

  final String? productdescription;
  final String? productsize;
  final String? productquantiy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Whitecolor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageViewWidget(productimage: productimage),
            k20Height,
            ProductNamePrice(
                productname: productname, productprice: productprice),
            k20Height,
            ProductDiscription(productdescription: productdescription),
            k20Height,
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'SIZE : ${productsize.toString()}',
                  style: TextStyle(
                      color: Whitecolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            k20Height,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Text(
                    'Quantity : ',
                    style: TextStyle(
                        color: Whitecolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    productquantiy.toString(),
                    style: TextStyle(
                        color: Whitecolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
