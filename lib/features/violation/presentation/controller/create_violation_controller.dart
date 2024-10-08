import '/config/all_imports.dart';

class CreateViolationController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // final ViolationsDatabaseController _violationsDatabase = ViolationsDatabaseController();
  final ViolationsDatabaseController _violationsDatabase =
      instance<ViolationsDatabaseController>();

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
  String policeName = 'خالد شبير';
  String policeImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

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

  void createViolation() async {
    if (_checkDataViolation()) {
      await confirmInformationDialog(
        context: Get.context!,
        text: ManagerStrings.theViolationWasSuccessfullyCreated,
        closeButton: () => Get.offAllNamed(Routes.policeManHomeScreen),
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
  }

  bool _checkDataViolation() {
    if (driverNameController.text.isNotEmpty &&
        driverIdController.text.isNotEmpty &&
        ownerNameController.text.isNotEmpty &&
        ownerIdController.text.isNotEmpty &&
        vehicleNumberController.text.isNotEmpty &&
        vehicleTypeController.text.isNotEmpty &&
        vehicleColorController.text.isNotEmpty &&
        placeOfViolationController.text.isNotEmpty &&
        reasonForViolationController.text.isNotEmpty &&
        violationTimeController.text.isNotEmpty &&
        violationDateController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
