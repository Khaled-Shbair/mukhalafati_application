import '/config/all_imports.dart';

class SearchForDriverController extends GetxController {
  late TextEditingController licenseNumberController;
  bool loading = false;
  bool result = true;

  @override
  void onInit() {
    super.onInit();
    licenseNumberController = TextEditingController();
  }

  @override
  void onClose() {
    licenseNumberController.dispose();
    super.onClose();
  }

  void searchButton() {}
}
