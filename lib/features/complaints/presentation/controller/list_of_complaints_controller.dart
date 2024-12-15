import '/config/all_imports.dart';

class ListOfComplaintsController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GetAllComplaintsUseCase _allComplaintsUseCase =
      instance<GetAllComplaintsUseCase>();

  static ListOfComplaintsController get to => Get.find();

  late String driverName;
  late String driverImage;
  bool loading = false;
  List<ComplaintDataModel> data = [];
  final List<String> _namesOfColumns = [
    AppConstants.hash,
    ManagerStrings.date,
    ManagerStrings.complaint,
    ManagerStrings.state,
  ];

  List<String> get namesOfColumns => _namesOfColumns;

  @override
  void onInit() {
    getComplaints();
    driverName =
        '${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}';
    driverImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);

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
      GetAllComplaintsInput(
        driverId:
            SharedPreferencesController.getInt(SharedPreferencesKeys.userId),
      ),
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
