import '/config/all_imports.dart';

class CreateComplaintsController extends GetxController with Helpers {
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final CreateComplaintUseCase _sendComplaintUseCase =
      instance<CreateComplaintUseCase>();
  late TextEditingController detailOfComplaint;
  late TextEditingController complaintName;
  late TextEditingController addressOfComplaint;
  late TextEditingController dateOfComplaint;
  DateTime _dateTime = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    detailOfComplaint = TextEditingController();
    complaintName = TextEditingController();
    addressOfComplaint = TextEditingController();
    dateOfComplaint = TextEditingController();
  }

  @override
  void dispose() {
    detailOfComplaint.dispose();
    complaintName.dispose();
    addressOfComplaint.dispose();
    dateOfComplaint.dispose();
    super.dispose();
  }

  void cancelButton() {
    Get.back();
    disposeCreateComplaints();
  }

  void createComplaintsButton() async {
    if (_checkData()) {
      (await _sendComplaintUseCase.execute(
        CreateComplaintInput(
          driverId: _sharedPreferences.getUserId(),
          addressOfComplaint: addressOfComplaint.text,
          complaintsName: complaintName.text,
          dateOfIncidentOrProblem: dateOfComplaint.text,
          detailOfComplaint: detailOfComplaint.text,
          statusOfComplaint: false,
        ),
      ))
          .fold(
        (l) {
          showSnackBar(message: l.message);
        },
        (r) async {
          Get.back();
          disposeListOfComplaints();
          Get.clearRouteTree();
          createdSuccessfullyDialog(
            closeButton: () async {
              initListOfComplaints();
              Get.back();
              Get.offAllNamed(Routes.listOfComplaintsScreen);
              disposeCreateComplaints();
            },
            text: ManagerStrings.complaintCreatedSuccessfully,
            context: Get.context!,
          );
        },
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
  }

  bool _checkData() {
    if (complaintName.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? selectedDateTime = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(AppConstants.firstDate),
      lastDate: DateTime(AppConstants.lastDate),
      barrierDismissible: false,
    );
    update();

    if (selectedDateTime != null) {
      _dateTime = selectedDateTime;
      dateOfComplaint.text =
          '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
    }

    update();
  }
}
