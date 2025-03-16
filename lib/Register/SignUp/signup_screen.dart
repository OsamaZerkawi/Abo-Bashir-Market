

import 'package:abo_bashir_market/data/services/api_service.dart';
import 'package:abo_bashir_market/register/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:abo_bashir_market/register/login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  final ApiService apiService;

  const SignupScreen({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(apiService),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Navigate to the home screen or another page
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
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
                                        style:
                                            TextStyle(color: Color(0xFF5BE15F)),
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
                              buildTextField('***************',
                                  obscureText: true),
                              buildLabel('كلمة سر التطبيق'),
                              buildTextField('***************',
                                  obscureText: true),
                              SizedBox(height: 50),
                              Center(
                                child: CustomElevatedButton(
                                  text: 'إنشاء الحساب',
                                  height: 50,
                                  width: screenWidth * 0.8,
                                  borderRadius: 30,
                                  onPressed: () {
                                    // Dispatch the signUp event with user data
                                    context.read<AuthCubit>().signUp({
                                      "username": "exampleUsername",
                                      "email": "example@example.com",
                                      "password": "examplePassword",
                                      "app_password": "exampleAppPassword"
                                    });
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
          },
        ),
      ),
    );
  }
}
