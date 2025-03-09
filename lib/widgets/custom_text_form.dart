import 'package:abo_bashir_market/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key,
      required this.text,
      required this.hint,
      required this.onSave,
      required this.validator});

  final String text;
  final String hint;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          alignment: Alignment.centerLeft,
          color: Colors.black,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              )),
        ),
      ],
    );
  }
}
