import '/config/all_imports.dart';

DataTable tableOfViolation(List<DataRow> rows) {
  return DataTable(
    horizontalMargin: ManagerWidth.w10,
    headingRowHeight: ManagerHeight.h40,
    dataRowMaxHeight: ManagerHeight.h40,
    dataRowMinHeight: ManagerHeight.h40,
    columnSpacing: rows.isNotEmpty ? ManagerWidth.w14 : null,
    decoration: BoxDecoration(
      border: Border.all(
        color: ManagerColors.platinum,
        width: ManagerWidth.w1,
      ),
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    columns: [
      dataColumnOfViolationTable(AppConstants.hash),
      dataColumnOfViolationTable(ManagerStrings.date),
      dataColumnOfViolationTable(ManagerStrings.amount),
      dataColumnOfViolationTable(ManagerStrings.state),
    ],
    rows: rows,
  );
}
