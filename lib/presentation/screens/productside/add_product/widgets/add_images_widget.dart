import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoea_admin/application/Bloc/Addproduct_bloc/add_product_bloc.dart';
import 'package:shoea_admin/core/constants.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

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
                onTap: () {
                  // ImageFunctions.selectImage();
                  BlocProvider.of<AddProductBloc>(context).add(SelectImage());
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
                      'Add Images',
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
              child: BlocBuilder<AddProductBloc, AddProductState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.images.length,
                      itemBuilder: (BuildContext context, int index) =>
                          imageContainer(context, state.images[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          k20Height,
                    ),
                  );
                },
              ),
            ),
            k20Height
          ],
        ),
      ),
    );
  }

  imageContainer(context, imgUrl) {
    final srcWidth = MediaQuery.of(context).size.width * 0.9;
    return Stack(children: [
      Container(
        width: srcWidth,
        height: srcWidth * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 5,
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<AddProductBloc>(context)
                .add(UnSelectImage(imgUrl: imgUrl));
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
