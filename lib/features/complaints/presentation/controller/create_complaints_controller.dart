import '/config/all_imports.dart';

class CreateComplaintsController extends GetxController with Helpers {
  late TextEditingController textOfComplaint;
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController date;

  @override
  void onInit() {
    super.onInit();
    textOfComplaint = TextEditingController();
    name = TextEditingController();
    address = TextEditingController();
    date = TextEditingController();
  }

  @override
  void dispose() {
    textOfComplaint.dispose();
    name.dispose();
    address.dispose();
    date.dispose();
    super.dispose();
  }

  void cancelButton() {
    Get.back();
    disposeCreateComplaints();
  }

  void createComplaintsButton() {
    if (_checkData()) {
      Get.back();
      createdSuccessfullyDialog(
        closeButton: () {
          Get.back();
          disposeCreateComplaints();
        },
        text: ManagerStrings.complaintCreatedSuccessfully,
        context: Get.context!,
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
  }

  bool _checkData() {
    if (name.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
