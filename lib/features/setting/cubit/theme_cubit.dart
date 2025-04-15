import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abo_bashir_market/core/databases/cache/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final CacheHelper cacheHelper;

  ThemeCubit(this.cacheHelper) : super(ThemeMode.system) {
    _loadSavedTheme();
  }

  static const String _themeKey = 'app_theme';

  Future<void> _loadSavedTheme() async {
    try {
      final savedTheme = cacheHelper.getData(key: _themeKey);
      if (savedTheme != null) {
        emit(_themeModeFromString(savedTheme));
      }
    } catch (e) {
      emit(ThemeMode.system);
    }
  }

  ThemeMode _themeModeFromString(String themeString) {
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  Future<void> toggleTheme() async {
    final newMode = _nextThemeMode(state);
    await _saveTheme(newMode);
    emit(newMode);
  }

  ThemeMode _nextThemeMode(ThemeMode current) {
    switch (current) {
      case ThemeMode.system:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      case ThemeMode.dark:
        return ThemeMode.system;
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    await _saveTheme(mode);
    emit(mode);
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    await cacheHelper.saveData(
      key: _themeKey,
      value: _themeModeToString(mode),
    );
  }
}
