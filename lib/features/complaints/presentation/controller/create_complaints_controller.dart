import '/config/all_imports.dart';

class CreateComplaintsController extends GetxController with Helpers {
  final ComplaintDatabaseController _complaintDatabase =
      instance<ComplaintDatabaseController>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

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

  void createComplaintsButton() async {
    if (_checkData()) {
      ComplaintModel complaint = ComplaintModel();
      complaint.complaintName = name.text;
      complaint.detailOfComplaint = textOfComplaint.text;
      complaint.addressOfComplaint = address.text;
      complaint.dateOfIncidentOrProblem = date.text;
      complaint.stateOfComplaint = 0;
      complaint.driverId = _sharedPreferences.getUserId();
      int newRowId = await _complaintDatabase.create(complaint);
      if (newRowId != 0) {
        complaint.complaintId = newRowId;
        Get.back();
        createdSuccessfullyDialog(
          closeButton: () {
            ListOfComplaintsController.to.getComplaints();
            Get.back();
            disposeCreateComplaints();
          },
          text: ManagerStrings.complaintCreatedSuccessfully,
          context: Get.context!,
        );
      }
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
