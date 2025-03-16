import 'package:abo_bashir_market/Archive/HomeScreen.dart';
import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/data/services/api_service.dart';
import 'package:abo_bashir_market/register/Login/ForgetPassowrd/foreget_password_screen.dart';
import 'package:abo_bashir_market/register/Login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/Login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/register/SignUp/signup_screen.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.1; // Responsive padding

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Text('أهلا وسهلا', style: kHeadingStyle(context)),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Center(
                    child: Text(
                      'مرحبا بك معنا مجددا، قم بتسجيل الدخول إلى حسابك',
                      style: kSubtitleStyle(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' أو قم ', style: kSubtitleStyle(context)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(
                                    apiService: ApiService(
                                        baseUrl: 'http://127.0.0.1:8000/api'),
                                  ),
                                ));
                          },
                          child: Text('إنشاء حساب جديد',
                              style: kLinkStyle(context)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.1),
                  buildLabel('البريد الإلكتروني'),
                  buildTextField('أدخل بريدك الإلكتروني',
                      textAlign: TextAlign.right),
                  buildLabel('كلمة المرور'),
                  buildTextField('***************',
                      obscureText: true, textAlign: TextAlign.right),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {},
                      ),
                      Text('تذكرني لمدة شهرين', style: kLabelStyle(context)),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.1),
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
                      backgroundColor: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen(),
                            ));
                      },
                      child: Text('هل نسيت كلمة المرور؟',
                          style: kLinkStyle(context)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
