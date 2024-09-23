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
  int _hour = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  void createViolation() async {
    await confirmInformationDialog(context: Get.context!);
  }

  String _date() {
    return '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}';
  }

  String _time() {
    _formatHour();
    if (DateTime.now().hour >= 12) {
      return 'PM ${_hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().second.toString()}';
    } else {
      return 'AM ${_hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().second.toString()}';
    }
  }

  void _formatHour() {
    switch (DateTime.now().hour) {
      case 1:
        _hour = 1;
      case 2:
        _hour = 2;
      case 3:
        _hour = 3;
      case 4:
        _hour = 4;
      case 5:
        _hour = 5;
      case 6:
        _hour = 6;
      case 7:
        _hour = 7;
      case 8:
        _hour = 8;
      case 9:
        _hour = 9;
      case 10:
        _hour = 10;
      case 11:
        _hour = 11;
      case 12:
        _hour = 12;
      case 13:
        _hour = 1;
      case 14:
        _hour = 2;
      case 15:
        _hour = 3;
      case 16:
        _hour = 4;
      case 17:
        _hour = 5;
      case 18:
        _hour = 6;
      case 19:
        _hour = 7;
      case 20:
        _hour = 8;
      case 21:
        _hour = 9;
      case 22:
        _hour = 10;
      case 23:
        _hour = 11;
      case 24:
        _hour = 12;
    }
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }
}
