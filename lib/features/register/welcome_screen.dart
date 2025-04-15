import 'package:abo_bashir_market/config/routes/router.dart';
import 'package:abo_bashir_market/features/setting/theme_toggle_button.dart';
import 'package:easy_localization/easy_localization.dart';
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
                context.push(signUpScreenID);
              },
              child: Text('SignUp'.tr()),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(loginScreenID);
              },
              child: Text('SignIn'.tr()),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(context.locale.languageCode == 'en'
                    ? Locale('ar')
                    : Locale('en'));
              },
              child: Text('ChangeLanguage'.tr()),
            ),
            ThemeToggleButton(),

            // ElevatedButton(
            //   onPressed: () {
            //     context.read<ThemeCubit>().toggleTheme();
            //   },
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(
            //         isDarkMode ? Icons.light_mode : Icons.dark_mode,
            //         color: isDarkMode ? Colors.white : Colors.black,
            //       ),
            //       SizedBox(width: 8),
            //       Text('ChangeTheme'.tr()),
            //     ],
            //   ),
            // ),

            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const SettingsScreen(),
            //         ),
            //       );
            //     },
            //     child: Text("Setting")),
          ],
        ),
      ),
    );
  }
}
