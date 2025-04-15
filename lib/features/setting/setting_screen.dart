import 'package:abo_bashir_market/features/setting/theme_selector.dart';
import 'package:abo_bashir_market/features/setting/theme_toggle_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'.tr())),
      body: ListView(
        children: [
          ListTile(
            title: Text('App Theme'.tr()),
            trailing: const ThemeToggleButton(),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Theme Mode',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const ThemeSelector(),
        ],
      ),
    );
  }
}
