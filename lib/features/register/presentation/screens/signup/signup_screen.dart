import 'dart:io';

import 'package:abo_bashir_market/config/routes/router.dart';
import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/core/helper/validator_helper.dart';
import 'package:abo_bashir_market/features/register/presentation/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/features/register/presentation/cubit/auth_state.dart';
import 'package:abo_bashir_market/features/register/presentation/widgets/buildTextField.dart';
import 'package:abo_bashir_market/features/register/presentation/widgets/buildlabel.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  // final ApiService apiService;

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // final _formKey = GlobalKey<FormState>(); // Form key for validation

  bool _isPasswordVisible = false;
  bool _isPasswordConfirmationVisible = false;
  bool _isAppPasswordVisible = false;

  // Controllers and FocusNodes for form fields
  late TextEditingController usernameController;

  late TextEditingController lastnameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late TextEditingController appPasswordController;
  // Image File
  File? _image;
  // FocusNodes
  late FocusNode usernameFocusNode;
  late FocusNode lastnameFocusNode;

  late FocusNode emailFocusNode;

  late FocusNode passwordFocusNode;
  late FocusNode passwordConfirmationFocusNode;
  late FocusNode appPasswordFocusNode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.statusCode}  ${state.data}'),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthSignUpSuccess) {
            // context.push(enterOtpScreenID);
            context.push('$emailVerifyScreenID/${emailController.text}');
          }
        },
        builder: (context, state) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          double padding = screenWidth * 0.1;

          if (state is AuthSignUpLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
          } else {
            return Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * .07),
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

                        GestureDetector(
                          onTap: _pickImage,
                          child: SizedBox(
                              height: 130,
                              width: 130,
                              child: _image == null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      backgroundImage: const AssetImage(
                                          "assets/images/avatar.png"),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: GestureDetector(
                                              onTap: () async {},
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade400,
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: GestureDetector(
                                                  onTap: _pickImage,
                                                  child: const Icon(
                                                    Icons.camera_alt_sharp,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundImage: FileImage(_image!),
                                    )),
                        ),

                        SizedBox(height: 20),
                        // Rest of the fields and labels...
                        Row(
                          children: [
                            buildLabel('الاسم'),
                            SizedBox(width: padding * 3.6),
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
                            SizedBox(width: padding),
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
                          obscureText: !_isPasswordVisible,
                          isPasswordField: true,
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          nextFocusNode: passwordConfirmationFocusNode,
                          onTogglePasswordVisibility: _togglePasswordVisibility,
                        ),
                        buildLabel('تأكيد كلمة المرور'),
                        buildTextField(
                          '***************',
                          obscureText: !_isPasswordConfirmationVisible,
                          isPasswordField: true,
                          controller: passwordConfirmationController,
                          focusNode: passwordConfirmationFocusNode,
                          nextFocusNode: appPasswordFocusNode,
                          onTogglePasswordVisibility:
                              _togglePasswordConfirmationVisibility,
                        ),

                        buildLabel('كلمة مرور التطبيق'),
                        buildTextField(
                          '***************',
                          obscureText: !_isAppPasswordVisible,
                          isPasswordField: true,
                          controller: appPasswordController,
                          focusNode: appPasswordFocusNode,
                          onTogglePasswordVisibility:
                              _toggleAppPasswordVisibility,
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: CustomElevatedButton(
                            text: 'إنشاء الحساب',
                            height: 50,
                            width: screenWidth * 0.8,
                            onPressed: () async {
                              String? emailError =
                                  ValidatorHelper.validateEmail(
                                      emailController.text);
                              String? passwordError =
                                  ValidatorHelper.validatePassword(
                                      passwordController.text);
                              String? confirmPasswordError =
                                  ValidatorHelper.validatePasswordConfirmation(
                                passwordController.text,
                                passwordConfirmationController.text,
                              );
                              String? appPasswordError =
                                  ValidatorHelper.validatePassword(
                                      appPasswordController.text);
                              String? firstNameError =
                                  ValidatorHelper.validateRequiredField(
                                      usernameController.text, 'الاسم');
                              String? lastNameError =
                                  ValidatorHelper.validateRequiredField(
                                      lastnameController.text, 'الكنية');

                              if (emailError != null ||
                                  passwordError != null ||
                                  confirmPasswordError != null ||
                                  appPasswordError != null ||
                                  firstNameError != null ||
                                  lastNameError != null) {
                                //Validate All Fields
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(emailError ??
                                        passwordError ??
                                        confirmPasswordError ??
                                        appPasswordError ??
                                        firstNameError ??
                                        lastNameError!),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              // Proceed with API call if no errors
                              // Map<String, dynamic> userData = {
                              //   "first_name": usernameController.text,
                              //   "last_name": lastnameController.text,
                              //   "email": emailController.text,
                              //   "password": passwordController.text,
                              //   "password_confirmation":
                              //       passwordConfirmationController.text,
                              //   "app_password": appPasswordController.text,
                              //   "image": _image?.path ?? '',
                              // };

                              await BlocProvider.of<AuthCubit>(context).signUp(
                                firstName: usernameController.text,
                                lastName: lastnameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                passwordConfirm:
                                    passwordConfirmationController.text,
                                appPassword: appPasswordController.text,
                                image: _image?.path ?? '',
                              );
                            },
                            borderRadius: 30,
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
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers and FocusNodes
    usernameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    appPasswordController.dispose();
    usernameFocusNode.dispose();
    lastnameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmationFocusNode.dispose();
    appPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    lastnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    appPasswordController = TextEditingController();

    // Initialize FocusNodes
    usernameFocusNode = FocusNode();
    lastnameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    passwordConfirmationFocusNode = FocusNode();
    appPasswordFocusNode = FocusNode();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل في اختيار الصورة: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _toggleAppPasswordVisibility() {
    setState(() {
      _isAppPasswordVisible = !_isAppPasswordVisible;
    });
  }

  void _togglePasswordConfirmationVisibility() {
    setState(() {
      _isPasswordConfirmationVisible = !_isPasswordConfirmationVisible;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
