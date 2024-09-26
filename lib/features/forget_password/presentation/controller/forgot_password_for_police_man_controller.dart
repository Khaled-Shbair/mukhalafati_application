import '/config/all_imports.dart';

class ForgotPasswordForPoliceManController extends GetxController {
  late TextEditingController jobNumber;

  @override
  void onInit() {
    super.onInit();
    jobNumber = TextEditingController();
  }

  @override
  void dispose() {
    jobNumber.dispose();
    super.dispose();
  }

  void backButton() {
    Get.back();
    disposeForgotPasswordForDriver();
  }

  void sendButton() {}
}
