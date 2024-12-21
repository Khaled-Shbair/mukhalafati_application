import '/config/all_imports.dart';

class LogoutController extends GetxController {
  void cancelButton() {
    Get.back();
    disposeLogout();
  }

  void logoutButton() async {
    await clearData();
    Get.offAndToNamed(Routes.loginScreen);
    disposeLogout();
  }
}
