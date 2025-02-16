import '/config/all_imports.dart';

class RouteMiddleware {
  RouteMiddleware._();

  static final _sharedPrefController = instance<SharedPreferencesController>();

  static String initialRoute() {
    if (_sharedPrefController.getBool(SharedPreferencesKeys.viewOnBoarding) ==
        false) {
      return Routes.onBoardingScreen;
    } else if (_sharedPrefController
        .getBool(SharedPreferencesKeys.rememberMeDriver)) {
      return Routes.driverHomeScreen;
    } else if (_sharedPrefController
        .getBool(SharedPreferencesKeys.rememberMePolice)) {
      return Routes.policeManHomeScreen;
    } else {
      return Routes.welcomeScreen;
    }
  }
}
