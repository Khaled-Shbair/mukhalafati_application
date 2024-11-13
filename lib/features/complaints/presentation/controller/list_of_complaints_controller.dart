import '/config/all_imports.dart';

class ListOfComplaintsController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GetAllComplaintsUseCase _allComplaintsUseCase =
      instance<GetAllComplaintsUseCase>();

  static ListOfComplaintsController get to => Get.find();

  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late String driverName;
  late String driverImage;
  bool loading = false;
  List<ComplaintDataModel> data = [];

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
    data = [];
    (await _allComplaintsUseCase.execute(
      GetAllComplaintsInput(driverId: _sharedPreferences.getUserId()),
    ))
        .fold(
      (l) {
        if (l.code == -1) {
          showSnackBar(message: l.message);
        }
      },
      (r) {
        data = r.data;
      },
    );
    loading = false;
    update();
  }
}
