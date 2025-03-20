import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/constants/router.dart';
import 'package:abo_bashir_market/data/services/api_service.dart';
import 'package:abo_bashir_market/register/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:abo_bashir_market/register/login/widgets/buildTextField.dart';
import 'package:abo_bashir_market/register/login/widgets/buildlabel.dart';
import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  final ApiService apiService;

  const SignupScreen({super.key, required this.apiService});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // final _formKey = GlobalKey<FormState>(); // Form key for validation

  bool _isPasswordVisible = false;
  bool _isPasswordConfirmationVisible = false;
  bool _isAppPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _togglePasswordConfirmationVisibility() {
    setState(() {
      _isPasswordConfirmationVisible = !_isPasswordConfirmationVisible;
    });
  }

  void _toggleAppPasswordVisibility() {
    setState(() {
      _isAppPasswordVisible = !_isAppPasswordVisible;
    });
  }

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

  // Function to pick an image
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Save the image file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            final message = jsonDecode(state.message);
            print('______________________________________________________');
            print(message);
            print('______________________________________________________');
            // if (message[] == '') {}
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthSuccess) {
            context.push('$enterOtpScreenID/${emailController.text}');
          }
        },
        builder: (context, state) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          double padding = screenWidth * 0.1;

          if (state is AuthLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
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
                          // Image Picker Section
                          GestureDetector(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey[300],
                              child: _image != null
                                  ? ClipOval(
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 120,
                                      ),
                                    )
                                  : Icon(
                                      Icons.camera_alt,
                                      size: 40,
                                      color: Colors.grey[800],
                                    ),
                            ),
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
                            onTogglePasswordVisibility:
                                _togglePasswordVisibility,
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
                                // Validate fields before sending the request
                                if (usernameController.text.isEmpty ||
                                    lastnameController.text.isEmpty ||
                                    emailController.text.isEmpty ||
                                    passwordController.text.isEmpty ||
                                    passwordConfirmationController
                                        .text.isEmpty ||
                                    appPasswordController.text.isEmpty) {
                                  // print('user name${usernameController.text}');
                                  // print('last name${lastnameController.text}');
                                  // print('email ${emailController.text}');
                                  // print('password ${passwordController.text}');
                                  // print(
                                  //     'password_confirmation ${passwordConfirmationController.text}');
                                  // print(
                                  //     'app_password ${appPasswordController.text}');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('تأكد من ملئ جميع الحقول')),
                                  );
                                  return;
                                }

                                // Email format validation
                                final emailRegex = RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                if (!emailRegex
                                    .hasMatch(emailController.text)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'يرجى إدخال بريد إلكتروني صالح')),
                                  );
                                  return;
                                }

                                // Password length validation
                                if (passwordController.text.length < 6) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'يجب أن تكون كلمة المرور على الأقل 6 أحرف')),
                                  );
                                  return;
                                }

                                // Password confirmation match validation
                                if (passwordController.text !=
                                    passwordConfirmationController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('كلمات المرور لا تتطابق')),
                                  );
                                  return;
                                }

                                // App password validation (example: not empty and at least 4 characters)
                                if (appPasswordController.text.length < 6) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'يجب أن تكون كلمة مرور التطبيق على الأقل 6 أحرف')),
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
                                  "app_password": appPasswordController.text,
                                  "image": _image?.path ??
                                      '', // Pass the image path here
                                };

                                // Call the API
                                await BlocProvider.of<AuthCubit>(context)
                                    .signUp(userData, _image);
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
              ),
            );
          }
        },
      ),
    );
  }
}
