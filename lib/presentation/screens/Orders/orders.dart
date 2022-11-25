import 'package:flutter/material.dart';
import 'package:shoea_admin/core/constants.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final List<String>? orderImage = [
    'https://rukminim1.flixcart.com/image/832/832/l58iaa80/shoe/9/y/q/-original-imagfyaseenuzn6d.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/4/j/1/6-nikefecion-6-nnikhe-blue-original-imaggxz9wf5s7q3d.jpeg?q=70',
  ];

  final List<String>? orderProductName = [
    'Nike Air Max',
    "Nike Jordan",
    'Nike shoe',
  ];

  final List<String>? orderProductPrice = [
    '2000',
    "3300",
    '1700',
  ];

  final List<String>? orderId = [
    '#010321',
    "#023671",
    '#082821',
  ];

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
            child: ListView.separated(
                separatorBuilder: (context, index) => k20Height,
                itemCount: orderId!.length,
                itemBuilder: (context, index) => Padding(
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
                              padding:
                                  const EdgeInsets.only(left: 40, right: 50),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Whitecolor),
                                    child: Image.network(
                                      "${orderImage![index]}",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  k20width,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Order id : ${orderId![index]}'),
                                      Text('${orderProductName![index]}'),
                                      Text('₹${orderProductPrice![index]}'),
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
                                        primary:
                                            Color.fromARGB(255, 12, 139, 55),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: const Text(
                                      'Accept Order',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                k20width,
                                k20width,
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xffdd0021),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Reject Order',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))));
  }
}
