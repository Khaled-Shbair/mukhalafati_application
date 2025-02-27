import '/config/all_imports.dart';

class LogoutController extends GetxController {
  final _sharedPreferencesController = instance<SharedPreferencesController>();

  void cancelButton(BuildContext context) {
    context.pop();
    disposeLogout();
  }

  void logoutButton(BuildContext context) async {
    if (context.mounted) {
      context.pushNamedAndRemoveAllUntil(Routes.loginScreen);
    }
    await clearData();
    disposeLogout();
  }

  Future<void> clearData() async {
    _sharedPreferencesController.removeData(SharedPreferencesKeys.image);
    _sharedPreferencesController.removeData(SharedPreferencesKeys.userId);
    _sharedPreferencesController.removeData(SharedPreferencesKeys.nameAr);
    _sharedPreferencesController.removeData(SharedPreferencesKeys.nameEn);
    _sharedPreferencesController.removeData(SharedPreferencesKeys.phoneNumber);
    _sharedPreferencesController.removeData(SharedPreferencesKeys.idNumber);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.licenseOrJobNumber);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.rememberMeDriver);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.rememberMePolice);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.expiryDateLicense);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.releaseDateLicense);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.licenseLevelsOfLicense);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.numberOfViolationsUnPaid);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.numberOfViolationsPaid);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.numberOfUnReadNotifications);
    _sharedPreferencesController
        .removeData(SharedPreferencesKeys.policeMilitaryRank);
  }
}
