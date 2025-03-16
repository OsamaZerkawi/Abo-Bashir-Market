import 'package:abo_bashir_market/constants/constants.dart';
import 'package:flutter/material.dart';

Widget buildTextField(String hintText,
    {bool obscureText = false, TextAlign textAlign = TextAlign.right}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: TextField(
      obscureText: obscureText,
      textAlign: textAlign, // Align text to the right
      cursorColor: kPrimaryColor, // Change cursor color
      autofocus: false,
      
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),

        // ✅ Default border (Gray)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),

        // ✅ When TextField is clicked (focused), border turns `kPrimaryColor`
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),

        // ✅ Border when the field is enabled but not focused
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    ),
  );
}
