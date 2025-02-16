import '/config/all_imports.dart';

class DriverHomeController extends GetxController {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _sharedPrefController = instance<SharedPreferencesController>();
  final _updateFcmTokenUseCase = instance<UpdateFcmTokenUseCase>();

  late String _driverFirstName;

  String _welcome = ManagerStrings.goodMorning;
  late int _counterOfNotification;
  late int _unPaidViolation;

  late int _paidViolation;
  bool _loading = false;

  bool get loading => _loading;

  String get welcome => _welcome;

  int get counterOfNotification => _counterOfNotification;

  int get unPaidViolation => _unPaidViolation;

  int get paidViolation => _paidViolation;

  String get driverFirstName => _driverFirstName;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onInit() async {
    super.onInit();
    _updateFcmToken();
    _paidViolation = _sharedPrefController
        .getInt(SharedPreferencesKeys.numberOfViolationsPaid);

    _counterOfNotification = _sharedPrefController
        .getInt(SharedPreferencesKeys.numberOfUnReadNotifications);

    _unPaidViolation = _sharedPrefController
        .getInt(SharedPreferencesKeys.numberOfUnReadNotifications);

    _driverFirstName = FormatNameHelper.firstNameAr(
        _sharedPrefController.getString(SharedPreferencesKeys.nameAr));
    changeWelcome();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// refresh fcm token when open user application
  void _updateFcmToken() async {
    if (!_sharedPrefController
        .getBool(SharedPreferencesKeys.isFcmTokenUpdated)) {
      String? fcmToken = await instance<FirebaseMessaging>().getToken();
      (await _updateFcmTokenUseCase
              .execute(UpdateFcmTokenUseCaseInput(fcmToken: fcmToken ?? '')))
          .fold(
        (l) {},
        (r) {
          _sharedPrefController.setData(
            SharedPreferencesKeys.isFcmTokenUpdated,
            true,
          );
          debugPrint('Updated Fcm Token: $fcmToken');
        },
      );
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
}
