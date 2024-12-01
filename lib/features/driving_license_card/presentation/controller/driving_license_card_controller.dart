import '/config/all_imports.dart';

class DrivingLicenseCardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
    licenseNumber = SharedPreferencesController.getString(
        SharedPreferencesKeys.licenseOrJobNumber);
    expiryDate = SharedPreferencesController.getString(
        SharedPreferencesKeys.expiryDateLicense);

    releaseDate = SharedPreferencesController.getString(
        SharedPreferencesKeys.releaseDateLicense);

    idNumber =
        SharedPreferencesController.getString(SharedPreferencesKeys.idNumber);
    nameAr =
        SharedPreferencesController.getString(SharedPreferencesKeys.fullNameAr);
    nameEn =
        SharedPreferencesController.getString(SharedPreferencesKeys.fullNameEn);

    licenseLevels = SharedPreferencesController.getString(
        SharedPreferencesKeys.licenseLevelsOfLicense);
    driverName =
        '${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}';
    imageDriver =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);
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
