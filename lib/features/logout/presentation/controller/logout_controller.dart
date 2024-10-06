import '/config/all_imports.dart';

class LogoutController extends GetxController {
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  void cancelButton() {
    Get.back();
    disposeLogout();
  }

  void logoutButton() {
    _sharedPreferences.clear();
    Get.offAndToNamed(Routes.loginScreen);
  }
}
