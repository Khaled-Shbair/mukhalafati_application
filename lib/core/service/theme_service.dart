import '/config/all_imports.dart';

class ThemeService {
  ThemeService._();

  static final _sharedPrefController = instance<SharedPreferencesController>();

  void changeTheme(bool isDarkMode) {
    _sharedPrefController.setData(SharedPreferencesKeys.darkTheme, isDarkMode);
    if (isDarkMode) {
      Get.changeTheme(managerDarkTheme());
    } else {
      Get.changeTheme(managerLightTheme());
    }
  }

  static ThemeMode get themeMode {
    if (_sharedPrefController.getBool(SharedPreferencesKeys.darkTheme)) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  static ThemeData get themeData {
    if (_sharedPrefController.getBool(SharedPreferencesKeys.darkTheme)) {
      return managerDarkTheme();
    } else {
      return managerLightTheme();
    }
  }

  static ThemeData get darkTheme => managerDarkTheme();
}
