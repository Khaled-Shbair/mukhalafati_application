import '/config/all_imports.dart';

Widget willPopScope({required Widget child}) {
  return PopScope(
    canPop: false,
    child: child,
  );
}
