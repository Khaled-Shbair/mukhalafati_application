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
  late String driverImage;

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
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void changeOpenFrontElectronicLicenseCard(bool value) {
    openFullElectronicLicenseCard = !value;
    openBackElectronicLicenseCard = !value;
    openFrontElectronicLicenseCard = value;
    update();
  }

  void changeOpenBackElectronicLicenseCard(bool value) {
    openFullElectronicLicenseCard = !value;
    openFrontElectronicLicenseCard = !value;
    openBackElectronicLicenseCard = value;
    update();
  }

  void changeOpenFullElectronicLicenseCard(bool value) {
    openFrontElectronicLicenseCard = !value;
    openBackElectronicLicenseCard = !value;
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
