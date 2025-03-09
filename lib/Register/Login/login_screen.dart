import 'package:abo_bashir_market/Archive/HomeScreen.dart';
import 'package:abo_bashir_market/Register/Login/ForgetPassowrd/foreget_password_screen.dart';
import 'package:abo_bashir_market/Register/SignUp/signup_screen.dart';
import 'package:abo_bashir_market/main.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'أهلا وسهلا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text('مرحبا بك معنا مجددا قم بتسجيل الدخول إلى حسابك'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SingupScreen();
                      },
                    ));
                  },
                  child: Text(
                    'بإنشاء حساب جديد',
                    style: TextStyle(color: Color(0xFF5BE15F)),
                  ),
                ),
                Text(' أو قم'),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 235),
              child: Text('البريد الإلكتروني'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'asamazarqawi@gmail.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Text('كلمة المرور'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: '***************',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CustomElevatedButton(
                text: 'تسجيل الدخول',
                height: 50,
                width: 350,
                borderRadius: 30,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff5BE15F)),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ForgetPasswordScreen();
                  },
                ));
              },
              child: Text(
                'هل نسيت كلمة المرور',
                style: TextStyle(color: Color(0xFF5BE15F)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
