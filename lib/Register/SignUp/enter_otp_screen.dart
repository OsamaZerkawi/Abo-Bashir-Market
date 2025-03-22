import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/register/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:abo_bashir_market/register/login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterOtpScreen extends StatelessWidget {
  final String email; // Email passed to this screen

  const EnterOtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    FocusNode otpFocusNode = FocusNode();

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'ادخل رمز التحقق',
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
                        controller: otpController,
                        focusNode: otpFocusNode,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'إعادة إرسال الرمز',
                          style: kLinkStyle(context),
                        ),
                      ),
                      SizedBox(height: 30),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('تم التحقق بنجاح!')),
                            );
                            // Navigate to next screen
                          } else if (state is AuthError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Center(
                            child: CustomElevatedButton(
                              text: state is AuthLoading
                                  ? 'جارٍ التحقق...'
                                  : 'تم',
                              height: 50,
                              width: screenWidth * 0.8,
                              borderRadius: 30,
                              onPressed: state is AuthLoading
                                  ? () {}
                                  : () {
                                      String otp = otpController.text;
                                      if (otp.isNotEmpty) {
                                        BlocProvider.of<AuthCubit>(context)
                                            .emailVerify(
                                                email: email, otp: otp);
                                        context.read<AuthCubit>().emailVerify(
                                              email: email,
                                              otp: otp,
                                            );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('يرجى إدخال رمز التحقق'),
                                          ),
                                        );
                                      }
                                    },
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xff5BE15F),
                            ),
                          );
                        },
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
