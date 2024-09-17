import '/config/all_imports.dart';

class CreateViolationController extends GetxController {
  late TextEditingController driverNameController;
  late TextEditingController driverIdController;
  late TextEditingController ownerNameController;
  late TextEditingController ownerIdController;
  late TextEditingController vehicleNumberController;
  late TextEditingController vehicleTypeController;
  late TextEditingController vehicleColorController;
  late TextEditingController violationTimeController;
  late TextEditingController violationDateController;
  late TextEditingController placeOfViolationController;
  late TextEditingController reasonForViolationController;

  @override
  void onInit() {
    driverNameController = TextEditingController();
    driverIdController = TextEditingController();
    ownerNameController = TextEditingController();
    ownerIdController = TextEditingController();
    vehicleNumberController = TextEditingController();
    vehicleTypeController = TextEditingController();
    vehicleColorController = TextEditingController();
    violationTimeController = TextEditingController(text: _time());
    violationDateController = TextEditingController(text: _date());
    placeOfViolationController = TextEditingController();
    reasonForViolationController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    driverNameController.dispose();
    driverIdController.dispose();
    ownerNameController.dispose();
    ownerIdController.dispose();
    vehicleNumberController.dispose();
    vehicleTypeController.dispose();
    vehicleColorController.dispose();
    violationTimeController.dispose();
    violationDateController.dispose();
    placeOfViolationController.dispose();
    reasonForViolationController.dispose();
    super.dispose();
  }

  void createViolation() {}

  String _date() {
    return '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}';
  }

  String _time() {
    return '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().second.toString()}';
  }
}
