import '/config/all_imports.dart';

class ListOfComplaintsController extends GetxController {
  final ComplaintDatabaseController _complaintDatabase =
      instance<ComplaintDatabaseController>();

  static ListOfComplaintsController get to => Get.find();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late String driverName;
  late String driverImage;
  bool loading = false;
  List<ComplaintModel> data = <ComplaintModel>[];

  @override
  void onInit() {
    getComplaints();
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
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
    dialogOfCreateComplaint(
      Get.context!,
    );
    update();
  }

  void getComplaints() async {
    loading = true;
    data = await _complaintDatabase.read();
    loading = false;
    update();
  }
}
