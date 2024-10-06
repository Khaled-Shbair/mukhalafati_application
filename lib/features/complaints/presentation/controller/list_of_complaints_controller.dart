import '/config/all_imports.dart';

class ListOfComplaintsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late String driverName;
  late String driverImage;

  List<DataOfComplaints> data = <DataOfComplaints>[
    // DataOfComplaints(
    //   state: true,
    //   text: 'تجاوزك الحد القانوني للسرعة',
    //   date: '24/9/2024',
    // ),
    // DataOfComplaints(
    //   state: false,
    //   text: 'الوقوف في مكان ممنوع الوقوف فيه',
    //   date: '10/12/2024',
    // ),
    // DataOfComplaints(
    //   state: true,
    //   text: ' تجاوزك الحد القانوني للسرعة المحددة',
    //   date: '31/12/2000',
    // ),
    // DataOfComplaints(
    //   state: false,
    //   text: 'تجاوز الاشارة الحمراء',
    //   date: '24/9/2024',
    // ),
  ];

  @override
  void onInit() {
    driverName =
        '${_sharedPreferences.firstName()} ${_sharedPreferences.lastName()}';
    driverImage = _sharedPreferences.image();
    super.onInit();
  }

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
