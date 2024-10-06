import '/config/all_imports.dart';

class DrivingLicenseCardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  String licenseNumber = '0015440';
  String expiryDate = '10-02-2024';
  String releaseDate = '22-02-2029';
  String idNumber = '802075986';
  String nameAr = 'محمد عبد الحليم عبد الفتاح مسعود';
  String nameEn = 'Mohammed A.A.Massoud';
  String licenseLevels = '[2  3  B]';

  String imageDriver =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';
  bool openFrontElectronicLicenseCard = false;
  bool openBackElectronicLicenseCard = false;
  bool openFullElectronicLicenseCard = false;
  late String driverName;
  late String driverImage;

  @override
  void onInit() {
    super.onInit();
    driverName =
        '${_sharedPreferences.firstName()} ${_sharedPreferences.lastName()}';
    driverImage = _sharedPreferences.image();
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
