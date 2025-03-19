import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/constants/router.dart';
import 'package:abo_bashir_market/data/services/api_service.dart';
import 'package:abo_bashir_market/register/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:abo_bashir_market/register/login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  final ApiService apiService;

  const SignupScreen({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    // Controllers and FocusNodes for form fields
    TextEditingController usernameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmationController =
        TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController appPasswordController = TextEditingController();

    FocusNode usernameFocusNode = FocusNode();
    FocusNode lastnameFocusNode = FocusNode();
    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();
    FocusNode passwordConfirmationFocusNode = FocusNode();
    FocusNode phoneFocusNode = FocusNode();
    FocusNode appPasswordFocusNode = FocusNode();

    return BlocProvider(
      create: (context) => AuthCubit(apiService),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            //   if (state is AuthSuccess) {
            //     // Navigate to the home screen or another page
            //     // Navigator.pushReplacementNamed(context, '/home');

            //   } else if (state is AuthError) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text(state.message)),
            //     );
            //   }

            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is AuthSuccess) {
              //todo!! i should pass the email dynamiclly
              context.go(enterOtpScreenID);
            }
          },
          builder: (context, state) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHight = MediaQuery.of(context).size.height;
            double padding = screenWidth * 0.1;
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is AuthSuccess) {
              return Center(
                child: Text('success state'),
              );
            } else {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHight * .07),
                            Center(
                              child: Text('إنشاء حساب جديد',
                                  style: kHeadingStyle(context)),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' لديك حساب بالفعل؟ قم ',
                                    style: kSubtitleStyle(context),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'بتسجيل الدخول',
                                      style: kLinkStyle(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                buildLabel('الاسم'),
                                SizedBox(
                                  width: padding * 3.6,
                                ),
                                buildLabel('الكنية'),
                              ],
                            ),
                            Row(
                              children: [
                                buildTextField(
                                  'ادخل الاسم',
                                  controller: usernameController,
                                  focusNode: usernameFocusNode,
                                  nextFocusNode: lastnameFocusNode,
                                  width: screenWidth * .35,
                                ),
                                SizedBox(
                                  width: padding,
                                ),
                                buildTextField(
                                  'ادخل الكنية',
                                  controller: lastnameController,
                                  focusNode: lastnameFocusNode,
                                  nextFocusNode: emailFocusNode,
                                  width: screenWidth * .35,
                                ),
                              ],
                            ),
                            buildLabel('البريد الإلكتروني'),
                            buildTextField(
                              'ادخل بريدك الإلكتروني',
                              controller: emailController,
                              focusNode: emailFocusNode,
                              nextFocusNode: passwordFocusNode,
                            ),
                            buildLabel('كلمة المرور'),
                            buildTextField(
                              '***************',
                              obscureText: true,
                              controller: passwordController,
                              focusNode: passwordFocusNode,
                              nextFocusNode: passwordConfirmationFocusNode,
                            ),
                            buildLabel('تأكيد كلمة المرور'),
                            buildTextField(
                              '***************',
                              controller: passwordConfirmationController,
                              focusNode: passwordConfirmationFocusNode,
                              nextFocusNode: phoneFocusNode,
                            ),
                            buildLabel('رقم الهاتف'),
                            buildTextField(
                              '***************',
                              controller: phoneController,
                              focusNode: phoneFocusNode,
                              nextFocusNode: appPasswordFocusNode,
                            ),
                            buildLabel('كلمة سر التطبيق'),
                            buildTextField(
                              '***************',
                              obscureText: true,
                              controller: appPasswordController,
                              focusNode: appPasswordFocusNode,
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: CustomElevatedButton(
                                text: 'إنشاء الحساب',
                                height: 50,
                                width: screenWidth * 0.8,
                                borderRadius: 30,
                                onPressed: () async {
                                  // Validate fields before sending request
                                  if (usernameController.text.isEmpty ||
                                      lastnameController.text.isEmpty ||
                                      emailController.text.isEmpty ||
                                      passwordController.text.isEmpty ||
                                      passwordConfirmationController
                                          .text.isEmpty ||
                                      phoneController.text.isEmpty ||
                                      appPasswordController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('تأكد من ملئ جميع الحقول')),
                                    );
                                    return;
                                  }

                                  // Prepare user data
                                  Map<String, dynamic> userData = {
                                    "first_name": usernameController.text,
                                    "last_name": lastnameController.text,
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                    "password_confirmation":
                                        passwordConfirmationController.text,
                                    "phone": phoneController.text,
                                    "app_password": appPasswordController.text,
                                    "image": '',
                                  };

                                  // Call the API
                                  await BlocProvider.of<AuthCubit>(context)
                                      .signUp(userData);
                                },
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xff5BE15F),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
