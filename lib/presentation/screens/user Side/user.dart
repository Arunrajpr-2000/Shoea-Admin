import 'package:flutter/material.dart';

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
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            horizontalMargin: 10,
            columnSpacing: 1,
            columns: const [
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                // DataCell(Text('1')),
                DataCell(Text('Arun')),
              ]),
              DataRow(cells: [
                //DataCell(Text('2')),
                DataCell(Text('Amr')),
              ]),
              DataRow(cells: [
                // DataCell(Text('3')),
                DataCell(Text('Naveen')),
              ]),
              DataRow(cells: [
                // DataCell(Text('4')),
                DataCell(Text('Aslam')),
              ]),
            ],
          ),
        ),
      ]),
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
