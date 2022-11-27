import 'package:flutter/material.dart';

import 'package:shoea_admin/presentation/screens/productside/add_product/widgets/text_fields_widget.dart';

import '../../../../core/constants.dart';
import '../add_product/widgets/add_image_widget.dart';

class editProduct extends StatelessWidget {
  editProduct({super.key});
  // ignore: non_constant_identifier_names
  final name_controller = TextEditingController(text: 'Nike Jordan');
  String? catogory;
  // ignore: non_constant_identifier_names
  final price_controller = TextEditingController(text: '3999');
  // ignore: non_constant_identifier_names
  final description_controller = TextEditingController(
      text:
          "You've got the hops and the speed—lace up in shoes that enhance what you bring to the court. The latest AJ is all about take-offs and landings, with multiple Air units to get you off the ground and Formula 23 foam to cushion your impact. Up top, you'll find layers of tough, reinforced leno-weave fabric that'll keep you contained—and leave your game uncompromised—no matter how fast you move.");

  final altPrice_controller = TextEditingController();
  final spec_controller = TextEditingController(text: '38 ');
  final quantity_controller = TextEditingController(text: '500');
  final rating_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Product',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButton<String>(
              focusColor: Colors.red,
              iconEnabledColor: Colors.red,
              dropdownColor: Whitecolor,
              items: <String>[
                'Nike',
                'Puma',
                'Reebook',
                'Addidas',
                'Under Armour',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                catogory = value;
              },
              hint: const Text(
                'Catogories',
                //state.catogory,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          //  },
          //   ),
          const SizedBox(
            height: 40,
          ),
          textfield(
              hint: 'Name of the Product',
              fieldWidth: MediaQuery.of(context).size.width * 0.9,
              controller: name_controller),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textfield(
                  hint: 'Price',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: price_controller),
              textfield(
                  hint: 'Quantity',
                  keybord: TextInputType.number,
                  fieldWidth: MediaQuery.of(context).size.width * 0.45,
                  controller: quantity_controller),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: textfield(
                hint: 'Description',
                lines: 5,
                fieldWidth: MediaQuery.of(context).size.width * 0.9,
                controller: description_controller),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButton<String>(
              focusColor: Colors.red,
              iconEnabledColor: Colors.red,
              dropdownColor: Whitecolor,
              items: <String>[
                '38',
                '40',
                '42',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                catogory = value;
              },
              hint: const Text(
                'Size',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // height_20,
          // AddImagesWidget(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  textStyle: const TextStyle(fontSize: 20),
                  //backgroundColor: Colors.green
                ),
                child: const Text('  ADD  '),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }
}
