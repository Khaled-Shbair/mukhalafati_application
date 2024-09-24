import '/config/all_imports.dart';

DataColumn dataColumnOfComplaintsTable(String data) {
  return DataColumn(
    headingRowAlignment: MainAxisAlignment.center,
    tooltip: data,
    label: Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ManagerColors.black70,
        fontFamily: ManagerFontFamily.cairo,
        fontSize: ManagerFontsSizes.f12,
        fontWeight: ManagerFontWeight.semiBold,
      ),
    ),
  );
}
