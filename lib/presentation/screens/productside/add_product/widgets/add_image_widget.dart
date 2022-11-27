// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shoea_admin/core/constants.dart';

// class AddImagesWidget extends StatelessWidget {
//   AddImagesWidget({super.key});

//   final List<String>? Imageurl = [
//     'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
//     'https://rukminim1.flixcart.com/image/832/832/k1i6ikw0/shoe/r/m/g/bq3204-002-7-nike-black-white-anthracite-original-imafh2hvnqttmhf9.jpeg?q=70',
//     'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/9/l/i/-original-imagjuhyc8djsphg.jpeg?q=70',
//     // 'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
//     // 'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
//     // 'https://rukminim1.flixcart.com/image/832/832/k1i6ikw0/shoe/r/m/g/bq3204-002-7-nike-black-white-anthracite-original-imafh2hvnqttmhf9.jpeg?q=70',
//     // 'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/9/l/i/-original-imagjuhyc8djsphg.jpeg?q=70',
//     // 'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: Colors.white70, width: 1),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 10,
//               ),
//               child: GestureDetector(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         ImagePicker().getImage(source: ImageSource.gallery);
//                       },
//                       icon: const Icon(
//                         Icons.add,
//                         size: 36,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const Text(
//                       'Add Image',
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Whitecolor),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 150,
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: Imageurl!.length,
//                   itemBuilder: (context, index) {
//                     return Image.network(Imageurl![index]);
//                   },
//                   separatorBuilder: (BuildContext context, int index) =>
//                       const SizedBox(
//                     // height: 5,
//                     width: 10,
//                   ),
//                 ),
//               ),
//             ),
//             // height_20,
//           ],
//         ),
//       ),
//     );
//   }

//   CircleAvatar colorCircle({required String color}) {
//     return CircleAvatar(
//       backgroundColor: Colors.white,
//       radius: 30,
//       child: CircleAvatar(
//         backgroundColor: Color(int.parse('0xFF$color')),
//         // backgroundColor: Color(0x09A8AB),
//         radius: 23,
//       ),
//     );
//   }
// }
