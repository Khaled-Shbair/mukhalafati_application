import '/config/all_imports.dart';

class CreateComplaintsController extends GetxController with CustomToast {
  final _createComplaintUseCase = instance<CreateComplaintUseCase>();
  final _sharedPrefController = instance<SharedPreferencesController>();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _detailOfComplaint;
  late TextEditingController _complaintName;
  late TextEditingController _addressOfComplaint;
  late TextEditingController _dateOfComplaint;

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get detailOfComplaint => _detailOfComplaint;

  TextEditingController get complaintName => _complaintName;

  TextEditingController get addressOfComplaint => _addressOfComplaint;

  TextEditingController get dateOfComplaint => _dateOfComplaint;
  DateTime _dateTime = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    _detailOfComplaint = TextEditingController();
    _complaintName = TextEditingController();
    _addressOfComplaint = TextEditingController();
    _dateOfComplaint = TextEditingController();
  }

  @override
  void dispose() {
    _detailOfComplaint.dispose();
    _complaintName.dispose();
    _addressOfComplaint.dispose();
    _dateOfComplaint.dispose();
    super.dispose();
  }

  void cancelButton(BuildContext context) {
    context.pop();
    disposeCreateComplaints();
  }

  void createComplaintsButton(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      customLoading(context);
      (await _createComplaintUseCase.execute(
        CreateComplaintInput(
          driverId: _sharedPrefController.getInt(SharedPreferencesKeys.userId),
          addressOfComplaint: _addressOfComplaint.text,
          complaintsName: _complaintName.text,
          dateOfIncidentOrProblem: _dateOfComplaint.text,
          detailOfComplaint: _detailOfComplaint.text,
          statusOfComplaint: false,
        ),
      ))
          .fold(
        (l) {
          context.pop();
          showToast(message: l.message, context: context);
        },
        (r) async {
          context.pop();
          ListOfComplaintsController.to.addNewComplaint(
            detailOfComplaint: _detailOfComplaint.text,
            dateOfIncidentOrProblem: _dateOfComplaint.text,
            status: false,
          );
          customCreatedSuccessfullyDialog(
            closeButton: () {
              if (context.mounted) {
                context.pop();
                context.pop();
              }
              disposeCreateComplaints();
            },
            text: ManagerStrings.complaintCreatedSuccessfully,
            context: context,
          );
        },
      );
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
      _dateOfComplaint.text =
          '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
    }

    update();
  }
}
