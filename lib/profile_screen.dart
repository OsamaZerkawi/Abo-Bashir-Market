import 'package:abo_bashir_market/features/setting/theme_toggle_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile '),
        actions: [ThemeToggleButton()],
      ),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
