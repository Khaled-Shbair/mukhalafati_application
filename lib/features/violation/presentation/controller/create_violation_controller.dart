import '/config/all_imports.dart';

class CreateViolationController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final CreateViolationUseCase _createViolationUseCase =
      instance<CreateViolationUseCase>();

  late TextEditingController driverName;
  late TextEditingController driverIdNumber;
  late TextEditingController ownerName;
  late TextEditingController ownerId;
  late TextEditingController vehicleNumber;
  late TextEditingController vehicleType;
  late TextEditingController vehicleColor;
  late TextEditingController violationTime;
  late TextEditingController violationDate;
  late TextEditingController placeOfViolation;
  late TextEditingController reasonForViolation;
  int _hour = 0;
  late String policeName;
  late String policeImage;

  @override
  void onInit() {
    policeName =
        '${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}';
    policeImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);
    driverName = TextEditingController();
    driverIdNumber = TextEditingController();
    ownerName = TextEditingController();
    ownerId = TextEditingController();
    vehicleNumber = TextEditingController();
    vehicleType = TextEditingController();
    vehicleColor = TextEditingController();
    violationTime = TextEditingController(text: _time());
    violationDate = TextEditingController(text: _date());
    placeOfViolation = TextEditingController();
    reasonForViolation = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    driverName.dispose();
    driverIdNumber.dispose();
    ownerName.dispose();
    ownerId.dispose();
    vehicleNumber.dispose();
    vehicleType.dispose();
    vehicleColor.dispose();
    violationTime.dispose();
    violationDate.dispose();
    placeOfViolation.dispose();
    reasonForViolation.dispose();
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

  void createViolation(context) async {
    if (_checkDataViolation()) {
      (await _createViolationUseCase.execute(
        CreateViolationUseCaseInput(
            priceOfViolation: 2,
            violationReason: '',
            driverIdNumber: driverIdNumber.text,
            driverName: driverName.text,
            ownerName: ownerName.text,
            ownerId: ownerId.text,
            violationAddress: placeOfViolation.text,
            reasonForViolation: reasonForViolation.text,
            vehicleColor: vehicleColor.text,
            vehicleNumber: vehicleNumber.text,
            violationDate: violationDate.text,
            vehicleType: vehicleType.text,
            violationTime: violationTime.text,
            policeManId: SharedPreferencesController.getInt(
                SharedPreferencesKeys.userId)),
      ))
          .fold(
        (l) {
          showSnackBar(message: l.message);
        },
        (r) async {
          await confirmInformationDialog(
            context: context,
            text: ManagerStrings.theViolationWasSuccessfullyCreated,
            closeButton: () => Get.offAllNamed(Routes.policeManHomeScreen),
          );
        },
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
  }

  bool _checkDataViolation() {
    if (driverName.text.isNotEmpty &&
        driverIdNumber.text.isNotEmpty &&
        ownerName.text.isNotEmpty &&
        ownerId.text.isNotEmpty &&
        vehicleNumber.text.isNotEmpty &&
        vehicleType.text.isNotEmpty &&
        vehicleColor.text.isNotEmpty &&
        placeOfViolation.text.isNotEmpty &&
        reasonForViolation.text.isNotEmpty &&
        violationTime.text.isNotEmpty &&
        violationDate.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
