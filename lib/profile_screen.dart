import 'package:abo_bashir_market/features/setting/theme_toggle_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile '),
        actions: [
          ThemeToggleButton(),
          ElevatedButton(
            onPressed: () {
              context.setLocale(context.locale.languageCode == 'en'
                  ? Locale('ar')
                  : Locale('en'));
            },
            child: Text('ChangeLanguage'.tr()),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
