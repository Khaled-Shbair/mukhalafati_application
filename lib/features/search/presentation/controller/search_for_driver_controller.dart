import '/config/all_imports.dart';

class SearchForDriverController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController licenseNumberController;
  bool loading = false;
  bool result = false;
  String licenseNumber = '10203040';
  String expiryDate = '10-02-2024';
  String releaseDate = '22-02-2029';
  String idNumber = '12345678';
  String nameAr = 'محمد عبد الحليم عبد الفتاح مسعود';
  String nameEn = 'Mohammed A.A.Massoud';
  String licenseLevels = '[2  3  B]';

  String imageDriver =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  // String imageDriver = 'https://upload.wikimedia.org/wikipedia/commons/4/44/%D8%B5%D9%88%D8%B1%D8%A9_%D8%B4%D8%AE%D8%B5%D9%8A%D8%A9_%D9%88%D9%84%D9%8A%D8%AF_%D8%A7%D9%84%D8%AD%D8%B4%D9%81.jpg';
  int numberOfViolations = 15;
  String policeName = 'خالد شبير';
  String policeImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  @override
  void onInit() {
    super.onInit();
    licenseNumberController = TextEditingController();
  }

  @override
  void onClose() {
    licenseNumberController.dispose();
    super.onClose();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void searchButton() {
    loading = true;
    if (licenseNumberController.text == '10203040') {
      result = true;
    } else {
      result = false;
    }
    loading = false;
    update();
  }
}
