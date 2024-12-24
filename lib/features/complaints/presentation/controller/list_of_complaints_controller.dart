import '/config/all_imports.dart';

class ListOfComplaintsController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GetAllComplaintsUseCase _allComplaintsUseCase =
      instance<GetAllComplaintsUseCase>();

  static ListOfComplaintsController get to => Get.find();

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
    super.onInit();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// Appear dialog to create complaint
  void submitComplaintButton() {
    initCreateComplaints();
    dialogOfCreateComplaint(
      Get.context!,
    );
    update();
  }

  /// Get all complaints of user from Api and save in list [data]
  void getComplaints() async {
    // First, appear loading until data comes from Api
    loading = true;
    // Second, empty list from previous data
    data = [];
    // send request to get data from api
    (await _allComplaintsUseCase.execute(
      GetAllComplaintsInput(
        driverId:
            SharedPreferencesController.getInt(SharedPreferencesKeys.userId),
      ),
    ))
        .fold(
      /// Failed request get complaints
      (l) {
        if (l.code == -1) {
          /// Appear message of error in SnackBar to user
          showSnackBar(message: l.message, context: Get.context!);
        }
      },

      /// Successfully request get complaints
      (r) {
        // save coming data in list [data]
        data = r.data;
      },
    );
    // Hide loading and appear data
    loading = false;
    update();
  }
}
