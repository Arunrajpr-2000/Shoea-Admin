import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';
import 'package:shoea_admin/function/order_fun.dart';
import 'package:shoea_admin/model/oder_model.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  // final List<String>? orderImage = [
  //   'https://rukminim1.flixcart.com/image/832/832/l58iaa80/shoe/9/y/q/-original-imagfyaseenuzn6d.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/4/j/1/6-nikefecion-6-nnikhe-blue-original-imaggxz9wf5s7q3d.jpeg?q=70',
  // ];

  // final List<String>? orderProductName = [
  //   'Nike Air Max',
  //   "Nike Jordan",
  //   'Nike shoe',
  // ];

  // final List<String>? orderProductPrice = [
  //   '2000',
  //   "3300",
  //   '1700',
  // ];

  // final List<String>? orderId = [
  //   '#010321',
  //   "#023671",
  //   '#082821',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Orders'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(email)
                    .collection('order')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        separatorBuilder: (context, index) => k20Height,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          QueryDocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              width: 200,
                              height: 170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Whitecolor),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 50),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Whitecolor),
                                          child: Image.network(
                                            documentSnapshot['images'][0],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        k20width,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text(
                                            //     'Order id : ${orderId![index]}'),
                                            SizedBox(
                                                width: 100,
                                                child: Text(
                                                  maxLines: 1,
                                                  '${documentSnapshot['name']}',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                )),
                                            Text(
                                                '₹${documentSnapshot['price']}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Colors.red,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  255, 12, 139, 55),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            acceptrejectOrder(
                                                orderModel: OrderModel(
                                                    isCanceled: false,
                                                    isDelivered: true,
                                                    id: documentSnapshot['id']),
                                                email: email);
                                          },
                                          child: const Text(
                                            'Accept Order',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      k20width,
                                      k20width,
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(0xffdd0021),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            acceptrejectOrder(
                                                orderModel: OrderModel(
                                                    isCanceled: true,
                                                    isDelivered: false,
                                                    id: documentSnapshot['id']),
                                                email: email);
                                          },
                                          child: const Text(
                                            'Reject Order',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Align(
                      alignment: FractionalOffset.center,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                })));
  }
}
