// import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               double screenWidth = constraints.maxWidth;
//               double padding = screenWidth * 0.1;

//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: padding),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 80),
//                     Center(
//                       child: Text(
//                         'إنشاء حساب جديد',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               'بتسجيل الدخول',
//                               style: TextStyle(color: Color(0xFF5BE15F)),
//                             ),
//                           ),
//                           Text(' لديك حساب بالفعل؟ قم'),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     buildLabel('اسم المستخدم'),
//                     buildTextField('أسامة زرقاوي'),
//                     buildLabel('البريد الإلكتروني'),
//                     buildTextField('example@gmail.com'),
//                     buildLabel('كلمة المرور'),
//                     buildTextField('***************', obscureText: true),
//                     buildLabel('كلمة مرور التطبيق'),
//                     buildTextField('***************', obscureText: true),
//                     SizedBox(height: 50),
//                     Center(
//                       child: CustomElevatedButton(
//                         text: 'إنشاء الحساب',
//                         height: 50,
//                         width: screenWidth * 0.8,
//                         borderRadius: 30,
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return SimpleDialog(
//                                 title: Text('Success'),
//                                 children: [Text('Signed Out 😁')],
//                               );
//                             },
//                           );
//                         },
//                         foregroundColor: Colors.white,
//                         backgroundColor: Color(0xff5BE15F),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 10),
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget buildTextField(String hint, {bool obscureText = false}) {
//     return TextField(
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hint,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//       ),
//     );
//   }
// }

import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double padding = screenWidth * 0.1;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80),
                      Center(
                        child: Text(
                          'إنشاء حساب جديد',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(color: Color(0xFF5BE15F)),
                              ),
                            ),
                            Text(' لديك حساب بالفعل؟ قم '),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      buildLabel('اسم المستخدم'),
                      buildTextField('أدخل اسم المستخدم'),
                      buildLabel('البريد الإلكتروني'),
                      buildTextField('أدخل بريدك الإلكتروني'),
                      buildLabel('كلمة المرور'),
                      buildTextField('***************', obscureText: true),
                      buildLabel('كلمة سر التطبيق'),
                      buildTextField('***************', obscureText: true),
                      SizedBox(height: 50),
                      Center(
                        child: CustomElevatedButton(
                          text: 'إنشاء الحساب',
                          height: 50,
                          width: screenWidth * 0.8,
                          borderRadius: 30,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: Text('نجاح'),
                                  children: [Text('تم تسجيل الحساب بنجاح 🎉')],
                                );
                              },
                            );
                          },
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff5BE15F),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
