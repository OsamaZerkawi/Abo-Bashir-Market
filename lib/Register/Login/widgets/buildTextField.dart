// A helper method for the text field
import 'package:flutter/material.dart';

Widget buildTextField(String hintText,
    {bool obscureText = false, TextAlign textAlign = TextAlign.left}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: TextField(
      obscureText: obscureText,
      textAlign: textAlign, // Align text to the right
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
    ),
  );
}
