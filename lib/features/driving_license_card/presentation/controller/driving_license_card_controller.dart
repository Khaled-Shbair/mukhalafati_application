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
  late String driverName;

  bool openFrontElectronicLicenseCard = false;
  bool openBackElectronicLicenseCard = false;
  bool openFullElectronicLicenseCard = false;

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

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// change value of [openFrontElectronicLicenseCard] when open front face
  /// of license card
  void changeOpenFrontElectronicLicenseCard(bool value) {
    openFrontElectronicLicenseCard = value;
    update();
  }

  /// change value of [openBackElectronicLicenseCard] when open back face
  /// of license card
  void changeOpenBackElectronicLicenseCard(bool value) {
    openBackElectronicLicenseCard = value;
    update();
  }

  /// change value of [openFullElectronicLicenseCard] when open two faces
  /// of license card
  void changeOpenFullElectronicLicenseCard(bool value) {
    openFullElectronicLicenseCard = value;
    update();
  }

  /// Hide [image] when open full electronic license card
  bool appearImageDrivingLicenseCard() {
    return openFullElectronicLicenseCard == false;
  }

  /// Hide [title] and [subTitle] when open any face of license card
  bool appearText() {
    return openFullElectronicLicenseCard == false &&
        openFrontElectronicLicenseCard == false &&
        openBackElectronicLicenseCard == false;
  }
}
