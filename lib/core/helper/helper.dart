import '/config/all_imports.dart';

mixin Helpers {
  /// Appear [SnackBar] with message when success or failed process.
  void showSnackBar({
    required String message,
    required BuildContext context,
    bool error = true,
  }) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: error
          ? context.theme.snackBarTheme.backgroundColor
          : context.theme.snackBarTheme.actionBackgroundColor,
      textColor: context.theme.snackBarTheme.contentTextStyle!.color ??
          context.theme.snackBarTheme.actionTextColor,
      fontSize: context.theme.snackBarTheme.contentTextStyle!.fontSize ??
          ManagerFontsSizes.f14,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
