import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key, 
    required this.controller, 
    this.isPW= false, 
    required this.hintText,
    required this.textInputType

  });
  final TextEditingController controller;
  final bool isPW;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {

    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context)
    );


    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        enabledBorder: inputBorder,
        errorBorder: inputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),

      keyboardType: textInputType,
      obscureText: isPW,
    );
  }
}