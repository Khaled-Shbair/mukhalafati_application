import '/config/all_imports.dart';

class PoliceManHomeController extends GetxController
    with GetSingleTickerProviderStateMixin, CustomToast {
  final _sharedPref = instance<SharedPreferencesController>();
  final _homePoliceManUseCase = instance<HomePoliceManUseCase>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  HomePoliceManModel? _homeData;

  late PageController _pageController;
  late TooltipBehavior _tooltipBehavior;
  bool _loading = false;
  int _currentPage = 0;
  String _policeFirstName = '';
  String _policeImage = '';
  String currentMonth = FormatDateAndTimeHelper.currentMonth;
  String currentDay = FormatDateAndTimeHelper.currentDay;
  String _welcome = ManagerStrings.goodMorning;

  bool _isSelectedButtonWeeklyViolations = true;
  bool _isSelectedButtonMonthlyViolations = false;

  bool get isSelectedButtonWeeklyViolations =>
      _isSelectedButtonWeeklyViolations;

  bool get loading => _loading;

  HomePoliceManModel? get homeData => _homeData;

  bool get isSelectedButtonMonthlyViolations =>
      _isSelectedButtonMonthlyViolations;

  String get welcome => _welcome;

  String get policeFirstName => _policeFirstName;

  String get policeImage => _policeImage;

  TooltipBehavior get tooltipBehavior => _tooltipBehavior;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  PageController get pageController => _pageController;

  @override
  void onInit() async {
    super.onInit();
    _policeImage = _sharedPref.getString(SharedPreferencesKeys.image);
    _policeFirstName = FormatNameHelper.firstNameAr(
        _sharedPref.getString(SharedPreferencesKeys.nameAr));

    getHomePoliceManData();
    getTotalViolationsFromDatabase();
    changeWelcome();
    _pageController = PageController();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void getTotalViolationsFromDatabase() {
    // totalViolations = _violationsDatabase
    //     .totalViolationsOfPolice(_sharedPreferences.getUserId())
    //     .toString();
  }

  /// Change the hello word based on time [goodEvening] and [goodMorning]
  void changeWelcome() {
    if (DateTime.now().hour >= 12) {
      _welcome = ManagerStrings.goodEvening;
    } else {
      _welcome = ManagerStrings.goodMorning;
    }
    update();
  }

  void buttonWeeklyViolations() {
    if (_currentPage == 1) {
      _isSelectedButtonMonthlyViolations = false;
      _isSelectedButtonWeeklyViolations = true;
      _pageController.previousPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
    update();
  }

  void buttonMonthlyViolations() {
    if (_currentPage == 0) {
      _isSelectedButtonMonthlyViolations = true;
      _isSelectedButtonWeeklyViolations = false;
      _pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
    update();
  }

  void onPageChanged(int page) {
    _currentPage = page;
    update();
  }

  void getHomePoliceManData() async {
    _loading = true;
    (await _homePoliceManUseCase.execute()).fold(
      (l) {
        showToast(message: l.message, context: Get.context!);
      },
      (r) {
        _homeData = r;
      },
    );
    _loading = false;
    update();
  }
}
