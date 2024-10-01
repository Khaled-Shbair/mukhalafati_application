import '/config/all_imports.dart';

DataColumn dataColumnOfViolationTable(String text) {
  return DataColumn(
    headingRowAlignment: MainAxisAlignment.center,
    label: textOfHeadViolationTable(text),
  );
}
