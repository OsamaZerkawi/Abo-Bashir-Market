import 'package:abo_bashir_market/config/routes/router.dart';
import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/register/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:abo_bashir_market/register/login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/services/helper/validator_helper.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  // Controllers and FocusNodes for form fields
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  @override
  initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.1; // Responsive padding

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is AuthLoginSuccess) {
              
              print('token is :${state.token}');
              context.push(homeScreenID);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('تم تسجيل الدخول بنجاح'),
                  duration: Duration(seconds: 2),
                  backgroundColor: kPrimaryColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: kPrimaryColor,
              ));
            } else {
              return Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child:
                              Text('أهلا وسهلا', style: kHeadingStyle(context)),
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
                                  context.push(signUpScreenID);
                                },
                                child: Text('إنشاء حساب جديد',
                                    style: kLinkStyle(context)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.1),
                        buildLabel('البريد الإلكتروني'),
                        buildTextField(
                          'أدخل بريدك الإلكتروني',
                          controller: emailController,
                          focusNode: emailFocusNode, // Non-nullable
                          nextFocusNode: passwordFocusNode,
                        ),
                        buildLabel('كلمة المرور'),
                        buildTextField(
                          '***************',
                          obscureText: !_isPasswordVisible,
                          isPasswordField: true,
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          onTogglePasswordVisibility: _togglePasswordVisibility,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              activeColor: kPrimaryColor,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                            ),
                            Text('تذكرني لمدة شهرين',
                                style: kLabelStyle(context)),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.1),
                        Center(
                          child: CustomElevatedButton(
                            text: 'تسجيل الدخول',
                            height: 50,
                            width: screenWidth * 0.8,
                            borderRadius: 30,
                            onPressed: () async {
                              String? emailError =
                                  ValidatorHelper.validateEmail(
                                      emailController.text);
                              String? passwordError =
                                  ValidatorHelper.validatePassword(
                                      passwordController.text);

                              if (emailError != null || passwordError != null) {
                                //Validate All Fields
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    emailError ?? passwordError!,
                                  ),
                                ));
                                return;
                              }

                              await BlocProvider.of<AuthCubit>(context).login(
                                email: emailController.text,
                                password: passwordController.text,
                                fcmToken: 'askdj',
                                rememberMe: _isChecked,
                              );
                            },
                            foregroundColor: Colors.white,
                            backgroundColor: kPrimaryColor,
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.05),
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('هل نسيت كلمة المرور؟',
                                style: kLinkStyle(context)),
                          ),
                        ),
                      ],
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
