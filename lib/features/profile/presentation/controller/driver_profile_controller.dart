import '/config/all_imports.dart';

class DriverProfileController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String driverName = 'خالد شبير';
  String driverImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  late TextEditingController driverNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController idNumberController;
  late TextEditingController licenceNumberController;

  @override
  void onInit() {
    super.onInit();
    driverNameController =
        TextEditingController(text: 'خالد عبد المنعم عثمان شبير');
    phoneNumberController = TextEditingController(text: '0599724037');
    idNumberController = TextEditingController(text: '407811736');
    licenceNumberController = TextEditingController(text: '93615796');
  }

  @override
  void dispose() {
    driverNameController.dispose();
    phoneNumberController.dispose();
    idNumberController.dispose();
    licenceNumberController.dispose();
    super.dispose();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void updateDataButton() {
    createdSuccessfullyDialog(
        closeButton: () {
          Get.offAllNamed(Routes.driverHomeScreen);
        },
        context: Get.context!,
        text: ManagerStrings.yourUpdateRequestHasBeenSubmittedSuccessfully,
        startPaddingText: ManagerWidth.w28,
        endPaddingText: ManagerWidth.w28,
        fontSizeText: ManagerFontsSizes.f16);
  }
}
