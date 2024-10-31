import '/config/all_imports.dart';

class PaymentController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final ViolationsDatabaseController _violationsDatabase =
      instance<ViolationsDatabaseController>();
  late PageController pageController;
  int currentStep = 0;
  bool paymentSelectionDone = false;
  bool enterDetailsDone = false;
  bool paymentConfirmationDone = false;
  bool isJawwalPay = false;
  bool isPalPay = false;
  bool isVisaCard = false;
  bool loading = false;
  late String driverName;
  late String driverImage;

  late TextEditingController cardHolderName;
  late TextEditingController cardNumber;
  late TextEditingController securityCode;
  late TextEditingController expiryDateCard;

  String paymentBy = ManagerStrings.visaCard;

  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
    cardHolderName = TextEditingController();
    cardNumber = TextEditingController();
    securityCode = TextEditingController();
    expiryDateCard = TextEditingController();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    cardHolderName.dispose();
    securityCode.dispose();
    cardNumber.dispose();
    expiryDateCard.dispose();
    super.dispose();
  }

  bool isFirstPage() => currentPage == 0;

  bool isTwoPage() => currentPage == 1;

  bool isThreePage() => currentPage == 2;

  void selectJawwalPay() {
    isJawwalPay = true;
    isPalPay = false;
    isVisaCard = false;
    paymentBy = ManagerStrings.jawwalPay;
    update();
  }

  void selectPalPay() {
    isJawwalPay = false;
    isPalPay = true;
    isVisaCard = false;
    paymentBy = ManagerStrings.palPay;
    update();
  }

  void selectVisaCard() {
    isJawwalPay = false;
    isPalPay = false;
    isVisaCard = true;
    paymentBy = ManagerStrings.visaCard;
    update();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void backButton() {
    disposePayment();
    Get.back();
  }

  void paymentSelectionButton() {
    if (isPalPay == true || isVisaCard == true || isJawwalPay == true) {
      loading = true;
      pageController.nextPage(
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeIn,
      );
      loading = false;
    } else {
      showSnackBar(message: ManagerStrings.pleaseSelectionPaymentWay);
    }
    update();
  }

  void completePaymentButton() {
    if (_checkData()) {
      loading = true;
      pageController.nextPage(
          duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
      loading = false;
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterPaymentCardDetails);
    }
    update();
  }

  void paymentConfirmationButton(int violationId) async {
    bool isSuccessful =
        await _violationsDatabase.paymentViolation(paymentBy, violationId);
    debugPrint(isSuccessful.toString());
    ViolationModel? s = await _violationsDatabase.show(violationId.toString());
    debugPrint(
        '${s!.violationPayedBy} ${s.violationState} ${s.priceOfViolation}');

    showDialog(
      context: Get.context!,
      barrierColor: ManagerColors.white,
      barrierDismissible: false,
      builder: (context) {
        return statePayment(
          isSuccessful: isSuccessful,
          button: () {
            if (isSuccessful) {
              cancelButton();
            } else {
              cancelButton();
            }
          },
        );
      },
    );
  }

  void cancelButton() {
    ViolationPaymentController.to.getDriverViolation();
    Get.back();
    Get.back();
    Get.back();
    disposePayment();
  }

  void changeCurrentPage(int value) {
    currentPage = value;
    update();
  }

  bool _checkData() {
    if (cardHolderName.text.isNotEmpty &&
        cardNumber.text.isNotEmpty &&
        securityCode.text.isNotEmpty &&
        expiryDateCard.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
