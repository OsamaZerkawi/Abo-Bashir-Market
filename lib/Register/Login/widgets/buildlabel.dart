// A helper method for the label with textAlign
import 'package:flutter/material.dart';

Widget buildLabel(String text, {TextAlign textAlign = TextAlign.right}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      text,
      textAlign: textAlign, // Align the label text
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
