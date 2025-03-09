import 'package:abo_bashir_market/Register/SignUp/signup_screen.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0,
              ),
              Text(
                'استعادة كلمة المرور',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text('قم بإدخال بريدك الإلكتروني لاستعادة كلمة المرور'),
              SizedBox(
                height: 50,
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
              SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                  text: 'استعادة كلمة المرور',
                  height: 50,
                  width: 350,
                  borderRadius: 30,
                  onPressed: () {
                 
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff5BE15F)),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
