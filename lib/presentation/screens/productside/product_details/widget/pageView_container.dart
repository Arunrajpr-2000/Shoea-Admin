import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key, required this.productimage})
      : super(key: key);

  final String? productimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Whitecolor,
        //borderRadius: BorderRadius.circular(20)
      ),
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.network(
            'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
            fit: BoxFit.contain,
          ),
          Image.network(
            'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/d/u/v/-original-imaggcyc5tzhrsej.jpeg?q=70',
            fit: BoxFit.contain,
          ),
          Image.network(
            'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/i/h/z/-original-imaggcycbbxxhkup.jpeg?q=70',
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
