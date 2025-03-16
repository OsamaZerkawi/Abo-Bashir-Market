// A helper method for the label with textAlign
import 'package:flutter/material.dart';

Widget buildLabel(String text, {Alignment alignment = Alignment.bottomRight}) {
  return Align(
    alignment: alignment,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
