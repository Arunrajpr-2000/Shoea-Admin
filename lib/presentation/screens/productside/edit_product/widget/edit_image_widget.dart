import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/function/image_function.dart';

class EditImageWidget extends StatefulWidget {
  EditImageWidget({required this.productImage, super.key});

  List? productImage;

  @override
  State<EditImageWidget> createState() => _EditImageWidgetState();
}

class _EditImageWidgetState extends State<EditImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white70, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: () async {
                  setState(() {});
                  final imageUrl = await ImageFunctions.getImage();
                  // if (imageUrl != null) {}
                  // widget.productImage!.remove(productimage);
                  ImageFunctions.addImage(widget.productImage!, imageUrl!);
                  // BlocProvider.of<AddProductBloc>(context).add(SelectImage());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add,
                      size: 36,
                      color: Colors.white,
                    ),
                    Text(
                      'Edit Images',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Whitecolor),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.productImage!.length,
                  itemBuilder: (BuildContext context, int index) =>
                      imageContainer(context, widget.productImage![index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      k20Height,
                ),
              ),
            ),
            k20Height
          ],
        ),
      ),
    );
  }

  imageContainer(context, productimage) {
    final srcWidth = MediaQuery.of(context).size.width * 0.9;
    return Stack(children: [
      Container(
        width: srcWidth,
        height: srcWidth * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(productimage),
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 5,
        child: GestureDetector(
          onTap: () {
            setState(() {});
            widget.productImage!.remove(productimage);
            log('Image removed ${widget.productImage}');
            log('image remove $productimage');
            // BlocProvider.of<AddProductBloc>(context)
            // .add(UnSelectImage(imgUrl: imgUrl));
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
            child: Icon(Icons.remove),
          ),
        ),
      )
    ]);
  }
}
