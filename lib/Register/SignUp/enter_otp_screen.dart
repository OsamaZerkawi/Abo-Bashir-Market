import 'package:abo_bashir_market/register/login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller and FocusNode for the email field
    TextEditingController emailController = TextEditingController();
    FocusNode emailFocusNode = FocusNode();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
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
                      Center(
                        child: Text(
                          'ادخل رقم التحقق',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                            'قم بإدخال رمز التحقق الذي تم ارساله إلى بريدك الإلكتروني'),
                      ),
                      SizedBox(height: 50),
                      buildLabel('رمز التحقق'),
                      buildTextField(
                        '123456',
                        controller: emailController,
                        focusNode: emailFocusNode,
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: CustomElevatedButton(
                          text: 'تم',
                          height: 50,
                          width: screenWidth * 0.8,
                          borderRadius: 30,
                          onPressed: () {
                            // Handle password recovery logic
                            String email = emailController.text;
                            if (email.isNotEmpty) {
                              // Call the API or method to reset the password
                              // Example: apiService.resetPassword(email);
                            } else {
                              // Show an error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('يرجى إدخال بريد إلكتروني'),
                                ),
                              );
                            }
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
}
