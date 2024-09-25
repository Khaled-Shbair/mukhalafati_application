import '/config/all_imports.dart';

class ListOfViolationsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String policeName = 'خالد شبير';
  String policeImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  List<DataListOfViolations> data = <DataListOfViolations>[
    DataListOfViolations(
      name: 'خالد عبد المنعم شبير',
      date: '9/18/2024',
      place: 'خانيونس - البلد - شارع شبير',
    ),
    DataListOfViolations(
      name: 'خالد عبد المنعم شبير',
      date: '9/18/2024',
      place: 'خانيونس - البلد - شارع شبير',
    ),
    DataListOfViolations(
      name: 'خالد عبد المنعم شبير',
      date: '9/18/2024',
      place: 'خانيونس - البلد - شارع شبير',
    ),
    DataListOfViolations(
      name: 'خالد عبد المنعم شبير',
      date: '9/18/2024',
      place: 'خانيونس - البلد - شارع شبير',
    ),
    DataListOfViolations(
      name: 'خالد عبد المنعم شبير',
      date: '9/18/2024',
      place: 'خانيونس - البلد - شارع شبير',
    ),
    DataListOfViolations(
      name: 'خالد عبد المنعم شبير',
      date: '9/18/2024',
      place: 'خانيونس - البلد - شارع شبير',
    ),
  ];

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }
}
