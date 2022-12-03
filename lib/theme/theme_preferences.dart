import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//! THEME MODE ENUMS
enum ThemeModeEnum {
  system, //! USE THE USER SYSTEM SETTINGS.
  light, //! REGARDLESS OF USER SYSTEM SETTINGS, USE LIGHT MODE
  dark //! SAME AS ABOVE, BUT DARK MODE
}

//!
//! THEME MODE PROVIDER
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, String>(
    (ref) => ThemeModeNotifier());

class ThemeModeNotifier extends StateNotifier<String> {
  late SharedPreferences systemPreferences;

  //! INITIALIZE VALUES
  Future _init() async {
    systemPreferences = await SharedPreferences.getInstance();
    String? themeMode = systemPreferences.getString("themeMode");
    state = themeMode ?? ThemeModeEnum.light.toString();
  }

  //! INITIALIZE VALUE TO LIGHT MODE
  ThemeModeNotifier() : super(ThemeModeEnum.light.toString()) {
    _init();
  }

  get theCurrentThemeMode => state;

  void toggle({required String newThemeMode}) async {
    state = newThemeMode;
    systemPreferences.setString("themeMode", state);
  }
}
