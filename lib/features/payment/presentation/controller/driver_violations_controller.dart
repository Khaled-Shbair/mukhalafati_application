import '/config/all_imports.dart';

class DriverViolationsController extends GetxController with CustomToast {
  static DriverViolationsController get to => Get.find();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _driverViolationsUseCase = instance<DriverViolationsUseCase>();
  final _sharedPrefController = instance<SharedPreferencesController>();
  final ScrollController _scrollController = ScrollController();

  bool _loading = false;
  bool _completeGetAllViolationsFormDatabase = false;

  int _page = 0;
  final List<String> _namesOfColumns = [
    AppConstants.hash,
    ManagerStrings.date,
    ManagerStrings.amount,
    ManagerStrings.state,
  ];

  List<DriverViolationsDataModel> allViolations = [];
  List<DriverViolationsDataModel> viewViolations = [];
  List<DriverViolationsDataModel> paidViolations = [];
  List<DriverViolationsDataModel> unpaidViolations = [];
  bool _paid = false;
  bool _unPaid = false;
  bool _maximumAmount = false;
  bool _minimumAmount = false;
  bool _oldestDate = false;
  bool _latestDate = false;

  bool get paid => _paid;

  bool get unPaid => _unPaid;

  bool get maximumAmount => _maximumAmount;

  bool get minimumAmount => _minimumAmount;

  bool get oldestDate => _oldestDate;

  bool get latestDate => _latestDate;

  bool get loading => _loading;

  List<String> get namesOfColumns => _namesOfColumns;

  ScrollController get scrollController => _scrollController;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 400 &&
            _completeGetAllViolationsFormDatabase == false) {
          _getMoreViolations();
        }
      });
    });
    getDriverViolation();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void selectPaidFilter() {
    _paid = !_paid;
    update();
  }

  void selectUnPaidFilter() {
    _unPaid = !_unPaid;
    update();
  }

  void selectOldestDateFilter() {
    _oldestDate = !_oldestDate;
    update();
  }

  void selectLatestDateFilter() {
    _latestDate = !_latestDate;
    update();
  }

  void selectMaximumAmountFilter() {
    _maximumAmount = !_maximumAmount;
    update();
  }

  void selectMinimumAmountFilter() {
    _minimumAmount = !_minimumAmount;
    update();
  }

  void _getMoreViolations() {
    _page++;
    getDriverViolation();
  }

  void cancelFilterButton() {
    _loading = true;
    _paid = false;
    _minimumAmount = false;
    _unPaid = false;
    _maximumAmount = false;
    _latestDate = false;
    _oldestDate = false;
    _loading = false;
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
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierColor: ManagerColors.black50,
      barrierDismissible: false,
      builder: (context) {
        return CustomViewViolationDetails(
          closeButton: () => context.pop(),
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

  void getDriverViolation() async {
    _loading = true;
    (await _driverViolationsUseCase.execute(
      DriverViolationsUseCaseInput(
        driverId: _sharedPrefController.getInt(SharedPreferencesKeys.userId),
        limit: 20,
        page: _page,
      ),
    ))
        .fold(
      (l) {
        allViolations = [];

        /// Appear message of error in SnackBar to user
        showToast(message: l.message, context: Get.context!);
      },
      (r) {
        if (r.data.isEmpty) {
          _completeGetAllViolationsFormDatabase = true;
        }
        allViolations.addAll(r.data);
        viewViolations = allViolations;
      },
    );
    _loading = false;
    update();
  }
}
