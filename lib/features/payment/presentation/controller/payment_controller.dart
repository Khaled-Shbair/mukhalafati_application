import 'package:mukhalafati_application/features/payment/presentation/view/widgets/state_payment.dart';

import '/config/all_imports.dart';

class PaymentController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController pageController;
  int currentStep = 0;
  bool paymentSelectionDone = false;
  bool enterDetailsDone = false;
  bool paymentConfirmationDone = false;
  bool isJawwalPay = false;
  bool isPalPay = false;
  bool isVisaCard = false;
  String driverName = 'خالد شبير';
  String driverImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  late TextEditingController cardHolderName;
  late TextEditingController cardNumber;
  late TextEditingController securityCode;
  late TextEditingController expiryDateCard;

  // String paymentBy = '';
  String paymentBy = ManagerStrings.jawwalPay;
  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
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

  void onStepContinue() {
    if (currentStep < 2) {
      currentStep += 1;
    }
    update();
  }

  void onStepCancel() {
    if (currentStep > 0) {
      currentStep -= 1;
    }
    update();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void backButton() {
    Get.back();
  }

  bool loading = false;

  void paymentSelectionButton() {
    loading = true;
    pageController.nextPage(
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeIn,
    );
    loading = false;
    update();
  }

  void completePaymentButton() {
    loading = true;
    pageController.nextPage(
        duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
    loading = false;
    update();
  }

  void paymentConfirmationButton() {
    showDialog(
      context: Get.context!,
      barrierColor: ManagerColors.white,
      barrierDismissible: false,
      builder: (context) {
        return statePayment(
          isSuccessful: false,
          button: () {
            Get.toNamed(Routes.violationPaymentScreen);
            disposePayment();
          },
        );
      },
    );
  }

  void cancelButton() {
    loading = true;
    pageController.previousPage(
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
    loading = false;
    update();
  }

  void changeCurrentPage(int value) {
    currentPage = value;
    update();
    debugPrint('$currentPage');
  }
}
