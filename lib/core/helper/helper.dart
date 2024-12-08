import '../../config/all_imports.dart';

mixin Helpers {
  void showSnackBar({required String message, bool error = true}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor:
          error ? ManagerColors.redNotification : ManagerColors.mayGreen,
      fontSize: ManagerFontsSizes.f14,
      gravity: ToastGravity.BOTTOM,
      textColor: ManagerColors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
