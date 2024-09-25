import '/config/all_imports.dart';

class PoliceManHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final String totalViolations = '999';
  String policeName = 'خالد شبير';
  String policeImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }
}
