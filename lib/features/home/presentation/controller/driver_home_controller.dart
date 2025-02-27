import '/config/all_imports.dart';

class DriverHomeController extends GetxController {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _homeDriverUseCase = instance<GetHomeDriverDataUseCase>();
  late HomeDriverModel _homeDriverData;
  String _welcome = ManagerStrings.goodMorning;
  bool _loading = false;

  bool get loading => _loading;

  HomeDriverModel get homeDriverData => _homeDriverData;

  String get welcome => _welcome;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onInit() async {
    getDriverHomeData();
    changeWelcome();
    super.onInit();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
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

  /// Navigate to [NotificationScreen]
  void notificationButton(BuildContext context) {
    context.pushNamed(Routes.notificationScreen);
  }

  void getDriverHomeData() async {
    _loading = true;
    (await _homeDriverUseCase.execute()).fold(
      (l) {},
      (r) async {
        _homeDriverData = r;
      },
    );

    _loading = false;
    update();
  }
}
