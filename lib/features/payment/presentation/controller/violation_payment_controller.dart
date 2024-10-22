import '/config/all_imports.dart';

class ViolationPaymentController extends GetxController {
  static ViolationPaymentController get to => Get.find();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late ExpansionTileController expansionTileController;

  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final ViolationsDatabaseController _violationsDatabase =
      instance<ViolationsDatabaseController>();
  late String driverName;
  late String driverImage;
  bool loading = false;
  String filter = ManagerStrings.filter;
  List allViolations = <ViolationModel>[];
  List viewViolations = <ViolationModel>[];
  List paidViolations = <ViolationModel>[];
  List unpaidViolations = <ViolationModel>[];

  @override
  void onInit() {
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
    getDriverViolation();
    expansionTileController = ExpansionTileController();
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
    loading = true;
    viewViolations = allViolations;
    expansionTileController.collapse();
    loading = false;
    update();
  }

  void unpaidButton() {
    loading = true;
    filter = ManagerStrings.unpaid;
    expansionTileController.collapse();

    unpaidViolations = [];
    for (var e in allViolations) {
      if (e.violationState == 0) {
        unpaidViolations.add(e);
      }
    }
    viewViolations = unpaidViolations;
    loading = false;
    update();
  }

  void paidButton() {
    loading = true;
    filter = ManagerStrings.paid;
    expansionTileController.collapse();
    paidViolations = [];
    for (var e in allViolations) {
      if (e.violationState == 1) {
        paidViolations.add(e);
      }
    }
    viewViolations = paidViolations;
    loading = false;
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
    required bool isPaid,
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
          isPaid: isPaid,
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
  }

  void backButton() {
    disposeViolationPayment();
    Get.back();
  }

  void getDriverViolation() async {
    loading = true;
    allViolations = [];
    viewViolations = [];
    allViolations =
        await _violationsDatabase.read(_sharedPreferences.getUserId());
    viewViolations = allViolations;
    loading = false;
    update();
  }
}
