import 'package:abo_bashir_market/config/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.push('$enterOtpScreenID/asamazarqawi@gmail.com');
                },
                child: Text('EnterOTP')),
            ElevatedButton(
                onPressed: () {
                  context.push(signUpScreenID);
                },
                child: Text('SignUp')),
            ElevatedButton(
                onPressed: () {
                  context.push(loginScreenID);
                },
                child: Text('SignIn')),
          ],
        ),
      ),
    );
  }
}
