import 'package:abo_bashir_market/Archive/HomeScreen.dart';
import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/data/services/api_service.dart';
import 'package:abo_bashir_market/register/Login/ForgetPassowrd/foreget_password_screen.dart';
import 'package:abo_bashir_market/register/Login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/Login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/register/SignUp/signup_screen.dart';
import 'package:abo_bashir_market/main.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set RTL direction for Arabic
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
                    crossAxisAlignment: CrossAxisAlignment
                        .end, // Align elements to the end (right)
                    children: [
                      Center(
                        child: Text(
                          'أهلا وسهلا',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                            'مرحبا بك معنا مجددا، قم بتسجيل الدخول إلى حسابك'),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' أو قم '),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(
                                        apiService: ApiService(
                                            baseUrl:
                                                'http://127.0.0.1:8000/api'),
                                      ),
                                    ));
                              },
                              child: Text(
                                'إنشاء حساب جديد',
                                style: TextStyle(color: kprimarycolor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      buildLabel('البريد الإلكتروني'),
                      buildTextField('أدخل بريدك الإلكتروني',
                          textAlign:
                              TextAlign.right), // TextField aligned to right
                      buildLabel('كلمة المرور', textAlign: TextAlign.right),
                      buildTextField('***************',
                          obscureText: true, textAlign: TextAlign.right),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            activeColor: kprimarycolor,
                            onChanged: (value) {},
                          ),
                          Text('تذكرني لمدة شهرين'),
                        ],
                      ),

                      // TextField aligned to right
                      SizedBox(height: 50),
                      Center(
                        child: CustomElevatedButton(
                          text: 'تسجيل الدخول',
                          height: 50,
                          width: screenWidth * 0.8,
                          borderRadius: 30,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          },
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff5BE15F),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPasswordScreen(),
                                ));
                          },
                          child: Text(
                            'هل نسيت كلمة المرور؟',
                            style: TextStyle(color: Color(0xFF5BE15F)),
                          ),
                        ),
                      ),
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
