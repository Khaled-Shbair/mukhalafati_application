import '/config/all_imports.dart';

class DrivingLicenseCardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late String licenseNumber;
  late String expiryDate;

  late String releaseDate;

  late String idNumber;

  late String nameAr;

  late String nameEn;

  late String licenseLevels;

  late String imageDriver;

  bool openFrontElectronicLicenseCard = false;
  bool openBackElectronicLicenseCard = false;
  bool openFullElectronicLicenseCard = false;
  late String driverName;

  @override
  void onInit() {
    super.onInit();
    licenseNumber = _sharedPreferences.getLicenseOrJobNumber();
    expiryDate = _sharedPreferences.getExpiryDateLicense();
    releaseDate = _sharedPreferences.getReleaseDateLicense();
    idNumber = _sharedPreferences.getIdNumber();
    nameAr = _sharedPreferences.getFullNameAr();
    nameEn = _sharedPreferences.getFullNameEn();
    licenseLevels = _sharedPreferences.getLicenseLevelsOfLicense();
    imageDriver = _sharedPreferences.getImage();
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void changeOpenFrontElectronicLicenseCard(bool value) {
    openFrontElectronicLicenseCard = value;
    update();
  }

  void changeOpenBackElectronicLicenseCard(bool value) {
    openBackElectronicLicenseCard = value;
    update();
  }

  void changeOpenFullElectronicLicenseCard(bool value) {
    openFullElectronicLicenseCard = value;
    update();
  }

  bool appearImageDrivingLicenseCard() {
    return openFullElectronicLicenseCard == false;
  }

  bool appearText() {
    return openFullElectronicLicenseCard == false &&
        openFrontElectronicLicenseCard == false &&
        openBackElectronicLicenseCard == false;
  }
}
