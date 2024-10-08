import '/config/all_imports.dart';

class SearchForDriverController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final DriverDatabaseController _driverDatabase =
      instance<DriverDatabaseController>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late TextEditingController licenseNumberController;
  bool loading = false;
  bool result = false;
  late String licenseNumber;

  late String expiryDate;
  late String releaseDate;

  late String idNumber;
  late String nameAr;
  late String nameEn;

  late String licenseLevels;

  late String imageDriver;

  // 'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  late int numberOfViolations;

  late String policeName;
  late String policeImage;

  @override
  void onInit() {
    super.onInit();
    policeName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    policeImage = _sharedPreferences.getImage();
    licenseNumberController = TextEditingController();
  }

  @override
  void onClose() {
    licenseNumberController.dispose();
    super.onClose();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void searchButton() async {
    loading = true;
    if (_checkDataPolice()) {
      DriverModel? driver =
          await _driverDatabase.getDriver(licenseNumberController.text);
      if (driver != null) {
        result = true;
        licenseNumber = driver.licenseNumber;
        expiryDate = driver.expiryDate;
        releaseDate = driver.releaseDate;
        idNumber = driver.driverIdNumber;
        nameAr =
            '${driver.driverFirstNameAr} ${driver.driverFatherNameAr} ${driver.driverGrandfatherNameAr} ${driver.driverLastNameAr}';
        nameEn = driver.driverNameEn;
        licenseLevels = driver.licenseLevels;
        imageDriver = driver.driverImage;
        numberOfViolations = driver.numberOfViolationsUnPaid;
      }
    } else {
      result = false;
    }
    loading = false;
    update();
  }

  bool _checkDataPolice() {
    if (licenseNumberController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
