import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoea_admin/presentation/screens/Orders/orders.dart';

class Userside extends StatelessWidget {
  const Userside({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Users',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                // separatorBuilder: (context, index) => SizedBox(
                //   height: 20,
                // ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        // width: 100.w,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  OrderScreen(email: documentSnapshot['email']),
                            ));
                          },
                          title: Text(
                            documentSnapshot['email'],
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Container(
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(30)),
                          //     child: documentSnapshot['isDeliverd'] == false&& documentSnapshot['iscanceled'] == false
                          //         ? Text('Checking in progress')
                          //         : Text('Shipped')),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.email,
                                color: Colors.red,
                              )),
                        )),
                  );
                },

                // children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: DataTable(
                //     horizontalMargin: 10,
                //     columnSpacing: 1,
                //     columns: const [
                //       DataColumn(
                //           label: Text('Name',
                //               style: TextStyle(
                //                   fontSize: 18, fontWeight: FontWeight.bold))),
                //     ],
                //     rows: const [
                //       DataRow(cells: [
                //         // DataCell(Text('1')),
                //         DataCell(Text('Arun')),
                //       ]),
                //       DataRow(cells: [
                //         //DataCell(Text('2')),
                //         DataCell(Text('Amr')),
                //       ]),
                //       DataRow(cells: [
                //         // DataCell(Text('3')),
                //         DataCell(Text('Naveen')),
                //       ]),
                //       DataRow(cells: [
                //         // DataCell(Text('4')),
                //         DataCell(Text('Aslam')),
                //       ]),
                //     ],
                //   ),
                // ),
                //]
              );
            } else {
              return const Align(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          }),
    );
  }
}

class UserHeads extends StatelessWidget {
  UserHeads({
    required this.title,
    Key? key,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
