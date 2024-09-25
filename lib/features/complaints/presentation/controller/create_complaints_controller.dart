import '/config/all_imports.dart';

class CreateComplaintsController extends GetxController {
  late TextEditingController textOfComplaint;

  @override
  void onInit() {
    super.onInit();
    textOfComplaint = TextEditingController();
  }

  @override
  void dispose() {
    textOfComplaint.dispose();
    super.dispose();
  }

  void cancelButton() {
    Get.back();
    disposeCreateComplaints();
  }

  void createComplaintsButton() {
    Get.back();
    createdSuccessfullyDialog(
      closeButton: () {
        Get.back();
        disposeCreateComplaints();
      },
      text: ManagerStrings.complaintCreatedSuccessfully,
      context: Get.context!,
    );
  }
}
