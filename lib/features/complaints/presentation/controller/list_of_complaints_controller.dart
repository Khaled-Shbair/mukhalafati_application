import '/config/all_imports.dart';

class ListOfComplaintsController extends GetxController with CustomToast {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  static ListOfComplaintsController get to => Get.find();

  final _allComplaintsUseCase = instance<GetAllComplaintsUseCase>();
  final _sharedPrefController = instance<SharedPreferencesController>();
  int _currentPage = 1;

  bool _loading = false;
  List<ComplaintDataModel> _data = [];
  final List<String> _namesOfColumns = [
    AppConstants.hash,
    ManagerStrings.date,
    ManagerStrings.complaint,
    ManagerStrings.state,
  ];

  bool get loading => _loading;

  ScrollController get scrollController => _scrollController;

  List<String> get namesOfColumns => _namesOfColumns;

  List<ComplaintDataModel> get data => _data;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool _completeGetAllComplaintsFormDatabase = false;

  bool get completeGetAllComplaintsFormDatabase =>
      _completeGetAllComplaintsFormDatabase;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent &&
            _completeGetAllComplaintsFormDatabase == false) {
          _getMoreComplaints();
        }
      });
    });
    getComplaints();
  }


  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// Appear dialog to create complaint
  void submitComplaintButton(BuildContext context) {
    initCreateComplaints();
    dialogOfCreateComplaint(context);
    update();
  }

  Future<void> _getMoreComplaints() async {
    _currentPage++;
    await getComplaints();
  }

  /// Get all complaints of user from Api and save in list [data]
  Future<void> getComplaints() async {
    // First, appear loading until data comes from Api
    _loading = true;
    // send request to get data from api
    (await _allComplaintsUseCase.execute(
      GetAllComplaintsInput(
        page: _currentPage,
        limit: 20,
        orderBy: 'desc',
        driverId: _sharedPrefController.getInt(SharedPreferencesKeys.userId),
      ),
    ))
        .fold(
      /// Failed request get complaints
      (l) {
        /// Appear message of error in SnackBar to user
        showToast(message: l.message, context: Get.context!);
      },

      /// Successfully request get complaints
      (r) {
        // to avoid send request and load on server when get all data
        if (r.data.isEmpty) {
          _completeGetAllComplaintsFormDatabase = true;
        }
        // save coming data in list [data]
        _data.addAll(r.data);
      },
    );
    // Hide loading and appear data
    _loading = false;
    update();
  }
}
