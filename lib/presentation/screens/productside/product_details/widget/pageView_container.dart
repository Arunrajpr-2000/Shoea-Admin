import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';

class PageViewWidget extends StatelessWidget {
  PageViewWidget({Key? key, required this.productimage}) : super(key: key);

  final List? productimage;

  final List<String>? Cartimage = [
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/d/u/v/-original-imaggcyc5tzhrsej.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/i/h/z/-original-imaggcycbbxxhkup.jpeg?q=70',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Whitecolor,
        //borderRadius: BorderRadius.circular(20)
      ),
      child: PageView.builder(
        itemCount: productimage!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return productimage![index] == null
              ? Image.network(Cartimage![index])
              : Image.network(productimage![index]);
        },
      ),
    );
  }
}
