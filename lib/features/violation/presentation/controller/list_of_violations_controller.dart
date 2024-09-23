import '/config/all_imports.dart';

class ListOfViolationsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
