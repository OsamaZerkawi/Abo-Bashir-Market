// import 'dart:io';

// import 'package:abo_bashir_market/config/routes/router.dart';
// import 'package:abo_bashir_market/constants/constants.dart';
// import 'package:abo_bashir_market/register/cubit/auth_cubit.dart';
// import 'package:abo_bashir_market/register/cubit/auth_state.dart';
// import 'package:abo_bashir_market/register/login/widgets/buildTextField.dart';
// import 'package:abo_bashir_market/register/login/widgets/buildlabel.dart';
// import 'package:abo_bashir_market/services/helper/validator_helper.dart';
// import 'package:abo_bashir_market/widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';

// class SignupScreen extends StatefulWidget {
//   // final ApiService apiService;

//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   // final _formKey = GlobalKey<FormState>(); // Form key for validation

//   bool _isPasswordVisible = false;
//   bool _isPasswordConfirmationVisible = false;
//   bool _isAppPasswordVisible = false;

//   // Controllers and FocusNodes for form fields
//   late TextEditingController usernameController;

//   late TextEditingController lastnameController;

//   late TextEditingController emailController;

//   late TextEditingController passwordController;
//   late TextEditingController passwordConfirmationController;
//   late TextEditingController appPasswordController;
//   // Image File
//   File? _image;
//   // FocusNodes
//   late FocusNode usernameFocusNode;
//   late FocusNode lastnameFocusNode;

//   late FocusNode emailFocusNode;

//   late FocusNode passwordFocusNode;
//   late FocusNode passwordConfirmationFocusNode;
//   late FocusNode appPasswordFocusNode;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is AuthError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.message),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           } else if (state is AuthSuccess) {
//             context.push('$enterOtpScreenID/${emailController.text}');
//           }
//         },
//         builder: (context, state) {
//           double screenWidth = MediaQuery.of(context).size.width;
//           double screenHeight = MediaQuery.of(context).size.height;
//           double padding = screenWidth * 0.1;

//           if (state is AuthLoading) {
//             return Center(
//                 child: CircularProgressIndicator(
//               color: kPrimaryColor,
//             ));
//           } else {
//             return Directionality(
//               textDirection: TextDirection.rtl,
//               child: Scaffold(
//                 body: Center(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: padding),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: screenHeight * .07),
//                           Center(
//                             child: Text('إنشاء حساب جديد',
//                                 style: kHeadingStyle(context)),
//                           ),
//                           SizedBox(height: 10),
//                           Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   ' لديك حساب بالفعل؟ قم ',
//                                   style: kSubtitleStyle(context),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text(
//                                     'بتسجيل الدخول',
//                                     style: kLinkStyle(context),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 30),
//                           // Image Picker Section
//                           GestureDetector(
//                             onTap: _pickImage,
//                             child: CircleAvatar(
//                               radius: 60,
//                               backgroundColor: Colors.grey[300],
//                               child: _image != null
//                                   ? ClipOval(
//                                       child: Image.file(
//                                         _image!,
//                                         fit: BoxFit.cover,
//                                         width: 120,
//                                         height: 120,
//                                       ),
//                                     )
//                                   : Icon(
//                                       Icons.camera_alt,
//                                       size: 40,
//                                       color: Colors.grey[800],
//                                     ),
//                             ),
//                           ),

//                           SizedBox(height: 20),
//                           // Rest of the fields and labels...
//                           Row(
//                             children: [
//                               buildLabel('الاسم'),
//                               SizedBox(width: padding * 3.6),
//                               buildLabel('الكنية'),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               buildTextField(
//                                 'ادخل الاسم',
//                                 controller: usernameController,
//                                 focusNode: usernameFocusNode,
//                                 nextFocusNode: lastnameFocusNode,
//                                 width: screenWidth * .35,
//                               ),
//                               SizedBox(width: padding),
//                               buildTextField(
//                                 'ادخل الكنية',
//                                 controller: lastnameController,
//                                 focusNode: lastnameFocusNode,
//                                 nextFocusNode: emailFocusNode,
//                                 width: screenWidth * .35,
//                               ),
//                             ],
//                           ),
//                           buildLabel('البريد الإلكتروني'),
//                           buildTextField(
//                             'ادخل بريدك الإلكتروني',
//                             controller: emailController,
//                             focusNode: emailFocusNode,
//                             nextFocusNode: passwordFocusNode,
//                           ),
//                           buildLabel('كلمة المرور'),
//                           buildTextField(
//                             '***************',
//                             obscureText: !_isPasswordVisible,
//                             isPasswordField: true,
//                             controller: passwordController,
//                             focusNode: passwordFocusNode,
//                             nextFocusNode: passwordConfirmationFocusNode,
//                             onTogglePasswordVisibility:
//                                 _togglePasswordVisibility,
//                           ),
//                           buildLabel('تأكيد كلمة المرور'),
//                           buildTextField(
//                             '***************',
//                             obscureText: !_isPasswordConfirmationVisible,
//                             isPasswordField: true,
//                             controller: passwordConfirmationController,
//                             focusNode: passwordConfirmationFocusNode,
//                             nextFocusNode: appPasswordFocusNode,
//                             onTogglePasswordVisibility:
//                                 _togglePasswordConfirmationVisibility,
//                           ),

//                           buildLabel('كلمة مرور التطبيق'),
//                           buildTextField(
//                             '***************',
//                             obscureText: !_isAppPasswordVisible,
//                             isPasswordField: true,
//                             controller: appPasswordController,
//                             focusNode: appPasswordFocusNode,
//                             onTogglePasswordVisibility:
//                                 _toggleAppPasswordVisibility,
//                           ),
//                           SizedBox(height: 20),
//                           Center(
//                             child: CustomElevatedButton(
//                               text: 'إنشاء الحساب',
//                               height: 50,
//                               width: screenWidth * 0.8,
//                               onPressed: () async {
//                                 String? emailError =
//                                     ValidatorHelper.validateEmail(
//                                         emailController.text);
//                                 String? passwordError =
//                                     ValidatorHelper.validatePassword(
//                                         passwordController.text);
//                                 String? confirmPasswordError = ValidatorHelper
//                                     .validatePasswordConfirmation(
//                                   passwordController.text,
//                                   passwordConfirmationController.text,
//                                 );
//                                 String? appPasswordError =
//                                     ValidatorHelper.validatePassword(
//                                         appPasswordController.text);
//                                 String? firstNameError =
//                                     ValidatorHelper.validateRequiredField(
//                                         usernameController.text, 'الاسم');
//                                 String? lastNameError =
//                                     ValidatorHelper.validateRequiredField(
//                                         lastnameController.text, 'الكنية');

//                                 if (emailError != null ||
//                                     passwordError != null ||
//                                     confirmPasswordError != null ||
//                                     appPasswordError != null ||
//                                     firstNameError != null ||
//                                     lastNameError != null) {
//                                   //Validate All Fields
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(emailError ??
//                                           passwordError ??
//                                           confirmPasswordError ??
//                                           appPasswordError ??
//                                           firstNameError ??
//                                           lastNameError!),
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   );
//                                   return;
//                                 }

//                                 // Proceed with API call if no errors
//                                 Map<String, dynamic> userData = {
//                                   "first_name": usernameController.text,
//                                   "last_name": lastnameController.text,
//                                   "email": emailController.text,
//                                   "password": passwordController.text,
//                                   "password_confirmation":
//                                       passwordConfirmationController.text,
//                                   "app_password": appPasswordController.text,
//                                   "image": _image?.path ?? '',
//                                 };

//                                 await BlocProvider.of<AuthCubit>(context)
//                                     .signUp(userData, _image);
//                               },
//                               borderRadius: 30,
//                               foregroundColor: Colors.white,
//                               backgroundColor: Color(0xff5BE15F),
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // Dispose controllers and FocusNodes
//     usernameController.dispose();
//     lastnameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     passwordConfirmationController.dispose();
//     appPasswordController.dispose();
//     usernameFocusNode.dispose();
//     lastnameFocusNode.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//     passwordConfirmationFocusNode.dispose();
//     appPasswordFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     usernameController = TextEditingController();
//     lastnameController = TextEditingController();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     passwordConfirmationController = TextEditingController();
//     appPasswordController = TextEditingController();

//     // Initialize FocusNodes
//     usernameFocusNode = FocusNode();
//     lastnameFocusNode = FocusNode();
//     emailFocusNode = FocusNode();
//     passwordFocusNode = FocusNode();
//     passwordConfirmationFocusNode = FocusNode();
//     appPasswordFocusNode = FocusNode();
//   }

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     try {
//       final XFile? pickedFile =
//           await picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('فشل في اختيار الصورة: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void _toggleAppPasswordVisibility() {
//     setState(() {
//       _isAppPasswordVisible = !_isAppPasswordVisible;
//     });
//   }

//   void _togglePasswordConfirmationVisibility() {
//     setState(() {
//       _isPasswordConfirmationVisible = !_isPasswordConfirmationVisible;
//     });
//   }

//   void _togglePasswordVisibility() {
//     setState(() {
//       _isPasswordVisible = !_isPasswordVisible;
//     });
//   }
// }
