import 'package:abo_bashir_market/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonSocial extends StatelessWidget {
  const CustomElevatedButtonSocial({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.imagePath,
  });

  final String text;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        fixedSize: Size(width, height),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: FittedBox(
                child: Image.asset(
              imagePath,
            )),
          ),
          const SizedBox(
            width: 50,
          ),
          FittedBox(child: CustomText(text: text, fontSize: 14)),
        ],
      ),
    );
  }
}
