// // import 'package:abo_bashir_market/constants/constants.dart';
// // import 'package:flutter/material.dart';

// // Widget BuildTextField(
// //   String hintText, {
// //   bool obscureText = false,
// //   TextAlign textAlign = TextAlign.right,
// //   TextEditingController? controller,
// //   required FocusNode focusNode,
// //   FocusNode? nextFocusNode,
// //   double? height,
// //   double? width,
// //   bool isPasswordField =
// //       false, // Add this flag to indicate if it's a password field
// //   VoidCallback?
// //       onTogglePasswordVisibility, // Function to toggle password visibility
// // }) {
// //   return Padding(
// //     padding: const EdgeInsets.only(bottom: 20.0),
// //     child: Container(
// //       height: height ?? 50,
// //       width: width ?? double.infinity,
// //       child: TextFormField(
// //         controller: controller,

// //         obscureText: obscureText,
// //         textAlign: textAlign,
// //         cursorColor: kPrimaryColor, // Change cursor color

// //         autofocus: false,
// //         focusNode: focusNode,
// //         textInputAction:
// //             nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
// //         onFieldSubmitted: (value) {
// //           if (nextFocusNode != null) {
// //             FocusScope.of(focusNode.context!).requestFocus(nextFocusNode);
// //           }
// //         },
// //         decoration: InputDecoration(
// //           hintText: hintText,
// //           hintStyle: TextStyle(color: Colors.grey),
// //           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide: BorderSide(color: Colors.grey, width: 1),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide: BorderSide(color: kPrimaryColor, width: 2),
// //           ),
// //           enabledBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide: BorderSide(color: Colors.grey, width: 1),
// //           ),
// //           suffixIcon: isPasswordField
// //               ? IconButton(
// //                   icon: Icon(
// //                     obscureText ? Icons.visibility_off : Icons.visibility,
// //                     color: Colors.grey,
// //                   ),
// //                   onPressed: onTogglePasswordVisibility,
// //                 )
// //               : null,
// //         ),
// //       ),
// //     ),
// //   );
// // }

// import 'package:abo_bashir_market/constants/constants.dart';
// import 'package:flutter/material.dart';

// Widget BuildTextField(
//   String hintText, {
//   bool obscureText = false,
//   // TextAlign textAlign = TextAlign.right,
//   TextEditingController? controller,
//   required FocusNode focusNode,
//   FocusNode? nextFocusNode,
//   double? height,
//   double? width,
//   bool isPasswordField = false,
//   VoidCallback? onTogglePasswordVisibility,
//   String? Function(String?)? validator, // Add validator function
// }) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 10.0),
//     child: SizedBox(
//       height: height ?? 70, // Increased height for error message space
//       width: width ?? double.infinity,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             // textAlign: textAlign,
//             cursorColor: kPrimaryColor,
//             autofocus: false,
//             focusNode: focusNode,
//             textInputAction: nextFocusNode != null
//                 ? TextInputAction.next
//                 : TextInputAction.done,
//             onFieldSubmitted: (value) {
//               if (nextFocusNode != null) {
//                 FocusScope.of(focusNode.context!).requestFocus(nextFocusNode);
//               }
//             },
//             decoration: InputDecoration(
//               hintText: hintText,
//               hintStyle: TextStyle(color: Colors.grey),
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.grey, width: 1),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: kPrimaryColor, width: 2),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.grey, width: 1),
//               ),
//               errorBorder: OutlineInputBorder(
//                 // Red border for errors
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.red, width: 2),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 // Red border on focus with error
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.red, width: 2),
//               ),
//               suffixIcon: isPasswordField
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                         color: Colors.grey,
//                       ),
//                       onPressed: onTogglePasswordVisibility,
//                     )
//                   : null,
//             ),
//             validator: validator, // Apply validation function
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final double? height;
  final double? width;
  final bool isPasswordField;
  final VoidCallback? onTogglePasswordVisibility;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final double? iconSize;

  const BuildTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.height,
    this.width,
    this.isPasswordField = false,
    this.onTogglePasswordVisibility,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: SizedBox(
        height: height ?? 70.h,
        width: width ?? double.infinity,
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          focusNode: focusNode,
          maxLines: maxLines,
          keyboardType: keyboardType,
          textInputAction: textInputAction ??
              (nextFocusNode != null
                  ? TextInputAction.next
                  : TextInputAction.done),
          onFieldSubmitted: (_) {
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          cursorColor: theme.colorScheme.primary,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: isPasswordField
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      // color: theme.hintColor,
                      size: iconSize,
                    ),
                    onPressed: onTogglePasswordVisibility,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
