import '/config/all_imports.dart';

class ViolationPaymentController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final ViolationsDatabaseController _violationsDatabase =
      instance<ViolationsDatabaseController>();
  late String driverName;
  late String driverImage;
  bool loading = false;
  String filter = ManagerStrings.filter;
  List dataOfViolation = <ViolationModel>[];

  @override
  void onInit() {
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
    super.onInit();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void cancelFilterButton() {
    filter = ManagerStrings.filter;
    update();
  }

  void unpaidButton() {
    filter = ManagerStrings.unpaid;
    update();
  }

  void paidButton() {
    filter = ManagerStrings.paid;
    update();
  }

  showViolationButton({
    required String date,
    required String numberOfViolation,
    required String price,
    required String placeOfViolation,
    required String timeOfViolation,
    required String reasonForViolation,
    required int violationId,
  }) {
    showDialog(
      context: Get.context!,
      barrierColor: ManagerColors.black50,
      barrierDismissible: false,
      builder: (context) {
        return viewViolationDetails(
          closeButton: () => Get.back(),
          payNowButton: () => payNowButton(
            price,
            violationId,
          ),
          date: date,
          numberOfViolation: numberOfViolation,
          price: price,
          placeOfViolation: placeOfViolation,
          timeOfViolation: timeOfViolation,
          reasonForViolation: reasonForViolation,
        );
      },
    );
  }

  void payNowButton(String price, int violationId) {
    Get.toNamed(
      Routes.paymentScreen,
      arguments: [price, violationId],
    );
    disposeViolationPayment();
  }

  void backButton() {
    Get.back();
    disposeViolationPayment();
  }

  void getDriverViolation() async {
    loading = true;
    dataOfViolation = await _violationsDatabase.read();
    loading = false;
    update();
  }
}
