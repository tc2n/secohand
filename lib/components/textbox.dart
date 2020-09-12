import 'package:secohand/constant.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final bool obscured;
  final controller;
  final validator;

  TextBox(
      {this.text,
      this.keyboardType = TextInputType.text,
      this.obscured = false,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        autocorrect: false,
        validator: validator,
        controller: controller,
        obscureText: obscured,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        style: typedText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: text,
          hintStyle: typedText.copyWith(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: Colors.black87),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
