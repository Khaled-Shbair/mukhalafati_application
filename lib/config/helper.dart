import 'all_imports.dart';

mixin Helpers {
  void showSnackBar({required String message}) {
    Get.snackbar(
      ManagerStrings.pleaseEnterTheRequiredData,
      '',
    );
  }
}
