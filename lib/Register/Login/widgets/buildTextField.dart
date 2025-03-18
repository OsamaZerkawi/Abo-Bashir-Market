import 'package:abo_bashir_market/constants/constants.dart';
import 'package:flutter/material.dart';

Widget buildTextField(
  String hintText, {
  bool obscureText = false,
  TextAlign textAlign = TextAlign.right,
  TextEditingController? controller,
  required FocusNode focusNode, // Change to required
  FocusNode? nextFocusNode,
  double? height, // Allow customization of height
  double? width, // Allow customization of width
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Container(
      height: height ?? 50, // Default height if not provided
      width: width ?? double.infinity, // Default to full width if not provided
      
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        
        textAlign: textAlign, // Align text to the right
        cursorColor: kPrimaryColor, // Change cursor color
        autofocus: false,
        focusNode: focusNode, // FocusNode can't be null
        textInputAction:
            nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
        onFieldSubmitted: (value) {
          if (nextFocusNode != null) {
            // FocusScope uses a non-null focusNode
            FocusScope.of(focusNode.context!).requestFocus(nextFocusNode);
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kPrimaryColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    ),
  );
}
