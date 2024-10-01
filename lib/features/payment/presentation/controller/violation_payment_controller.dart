import '/config/all_imports.dart';

class ViolationPaymentController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String driverName = 'خالد شبير';
  String driverImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';
  String filter = ManagerStrings.filter;
  List dataOfViolation = <DataOfViolation>[
    DataOfViolation(
      isPaid: true,
      date: '18/9/2024',
      price: 100,
      timeOfViolation: '10:00 AM',
      placeOfViolation: 'خانيونس - البلد - شارع شبير',
      numberOfViolation: '491158',
      reasonForViolation: 'تجاوزك الحد القانوني للسرعة',
    ),
    DataOfViolation(
      isPaid: true,
      date: '12/12/2024',
      price: 10000,
      timeOfViolation: '12:40 PM',
      placeOfViolation: 'جباليا البلد شارع السكة',
      numberOfViolation: '496558',
      reasonForViolation: 'الوقوف في مكان ممنوع الوقوف فيه',
    ),
    DataOfViolation(
      isPaid: false,
      date: '20/1/2024',
      price: 8000,
      timeOfViolation: '3:42 AM',
      placeOfViolation: 'دير البلح البلد دوار المدفع',
      numberOfViolation: '491354',
      reasonForViolation: 'عدم ربط حزام الأمان',
    ),
  ];

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
  }) {
    showDialog(
      context: Get.context!,
      barrierColor: ManagerColors.black50,
      barrierDismissible: false,
      builder: (context) {
        return viewViolationDetails(
          closeButton: () => Get.back(),
          payNowButton: () => payNowButton(price),
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

  void payNowButton(String price) {
    Get.toNamed(Routes.paymentScreen, arguments: price);
    disposeViolationPayment();
  }

  void backButton() {
    Get.back();
    disposeViolationPayment();
  }
}
