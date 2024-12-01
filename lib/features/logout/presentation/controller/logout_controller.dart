import '/config/all_imports.dart';

class LogoutController extends GetxController {
  void cancelButton() {
    Get.back();
    disposeLogout();
  }

  void logoutButton() async {
    await AppSettingsSharedPreferences.clear();
    Get.offAndToNamed(Routes.loginScreen);
  }
}
