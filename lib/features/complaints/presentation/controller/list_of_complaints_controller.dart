import '/config/all_imports.dart';

class ListOfComplaintsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController textOfComplaint;
  String driverName = 'خالد شبير';
  String driverImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  List<DataOfComplaints> data = <DataOfComplaints>[
    DataOfComplaints(
      state: true,
      text: 'تجاوزك الحد القانوني للسرعة',
      date: '24/9/2024',
    ),
    DataOfComplaints(
      state: false,
      text: 'الوقوف في مكان ممنوع الوقوف فيه',
      date: '10/12/2024',
    ),
    DataOfComplaints(
      state: true,
      text: ' تجاوزك الحد القانوني للسرعة المحددة',
      date: '31/12/2000',
    ),
    DataOfComplaints(
      state: false,
      text: 'تجاوز الاشارة الحمراء',
      date: '24/9/2024',
    ),
  ];

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void submitComplaintButton() {
    initCreateComplaints();
    dialogOfCreateComplaint(Get.context!);
  }
}
