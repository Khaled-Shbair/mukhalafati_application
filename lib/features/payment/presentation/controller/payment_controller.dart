import '/config/all_imports.dart';

class PaymentController extends GetxController with CustomToast {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _paymentViolationUseCase = instance<PaymentViolationUseCase>();
  late PageController _pageController;
  bool _paymentSelectionDone = false;
  bool _enterDetailsDone = false;
  bool _paymentConfirmationDone = false;
  bool _isJawwalPay = false;
  bool _isPalPay = false;
  bool _isVisaCard = false;
  bool _loading = false;

  late TextEditingController _cardHolderName;
  late TextEditingController _cardNumber;
  late TextEditingController _securityCode;
  late TextEditingController _expiryDateCard;

  String _paymentBy = ManagerStrings.visaCard;

  int _currentPage = 0;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  PageController get pageController => _pageController;

  bool get paymentSelectionDone => _paymentSelectionDone;

  GlobalKey<FormState> get formKey => _formKey;

  String get paymentBy => _paymentBy;

  get isVisaCard => _isVisaCard;

  bool get isPalPay => _isPalPay;

  bool get isJawwalPay => _isJawwalPay;

  bool get loading => _loading;

  bool get paymentConfirmationDone => _paymentConfirmationDone;

  bool get enterDetailsDone => _enterDetailsDone;

  TextEditingController get cardHolderName => _cardHolderName;

  TextEditingController get cardNumber => _cardNumber;

  TextEditingController get securityCode => _securityCode;

  TextEditingController get expiryDateCard => _expiryDateCard;

  @override
  void onInit() {
    super.onInit();
    _cardHolderName = TextEditingController();
    _cardNumber = TextEditingController();
    _securityCode = TextEditingController();
    _expiryDateCard = TextEditingController();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cardHolderName.dispose();
    _securityCode.dispose();
    _cardNumber.dispose();
    _expiryDateCard.dispose();
    super.dispose();
  }

  bool isFirstPage() => _currentPage == 0;

  bool isTwoPage() => _currentPage == 1;

  bool isThreePage() => _currentPage == 2;

  void selectJawwalPay() {
    _isJawwalPay = true;
    _isPalPay = false;
    _isVisaCard = false;
    _paymentBy = ManagerStrings.jawwalPay;
    update();
  }

  void selectPalPay() {
    _isJawwalPay = false;
    _isPalPay = true;
    _isVisaCard = false;
    _paymentBy = ManagerStrings.palPay;
    update();
  }

  void selectVisaCard() {
    _isJawwalPay = false;
    _isPalPay = false;
    _isVisaCard = true;
    _paymentBy = ManagerStrings.visaCard;
    update();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void backButton(BuildContext context) {
    if (isFirstPage()) {
      context.pop();
      disposePayment();
    } else {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeIn,
      );
    }
  }

  void paymentSelectionButton(BuildContext context) {
    if (_isPalPay == true || _isVisaCard == true || _isJawwalPay == true) {
      _loading = true;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeIn,
      );
      _loading = false;
    } else {
      showToast(
          message: ManagerStrings.pleaseSelectionPaymentWay, context: context);
    }
    update();
  }

  void completePaymentButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _loading = true;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
      _loading = false;
    } else {
      showToast(
        message: ManagerStrings.pleaseEnterPaymentCardDetails,
        context: context,
      );
    }
    update();
  }

  void paymentConfirmationButton(int violationId) async {
    (await _paymentViolationUseCase.execute(
      PaymentViolationUseCaseInput(
        violationId: violationId,
        violationState: true,
        violationPayedBy: _paymentBy,
        paymentDateAndTime:
            '${FormatDateAndTimeHelper.dateNow} ${FormatDateAndTimeHelper.timeNow}',
      ),
    ))
        .fold(
      (l) {
        _successfulOrFallPaymentProcess(false);
      },
      (r) {
        _successfulOrFallPaymentProcess(true);
      },
    );
  }

  void _successfulOrFallPaymentProcess(bool isSuccessful) {
    showDialog(
      context: Get.context!,
      barrierColor: ManagerColors.white,
      barrierDismissible: false,
      builder: (context) {
        return CustomStatusPayment(
          isSuccessful: isSuccessful,
          button: () {
            if (isSuccessful) {
              disposeViolationPayment();
              context.pushNamedAndRemoveAllUntil(Routes.violationPaymentScreen);
              disposePayment();
            } else {
              context.pop();
              context.pop();
              context.pop();
              disposePayment();
            }
          },
        );
      },
    );
  }

  void cancelButton(BuildContext context) {
    context.pop();
    context.pop();
    context.pop();
    disposePayment();
  }

  void changeCurrentPage(int value) {
    _currentPage = value;
    update();
  }
}
