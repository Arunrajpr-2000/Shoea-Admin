import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  TextfieldWidget(
      {Key? key,
      required this.controller,
      required this.productField,
      this.keyboardType,
      required this.labelName})
      : super(key: key);

  TextEditingController? controller;
  String? productField;
  String? labelName;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          label: Text(
            labelName.toString(),
            style: const TextStyle(color: Colors.white70),
          ),
          // hintText: 'Name Of the Product',
          hintStyle: const TextStyle(color: Colors.white70)),
      onChanged: (String name) {
        productField = name;
      },
    );
  }
}
