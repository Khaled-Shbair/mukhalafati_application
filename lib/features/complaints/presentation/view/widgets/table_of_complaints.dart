import '/config/all_imports.dart';

DataTable tableOfComplaints({required List<DataRow> rows}) {
  return DataTable(
    decoration: BoxDecoration(
      border: Border.all(
        color: ManagerColors.platinum,
        width: ManagerWidth.w1,
      ),
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    headingRowHeight: ManagerHeight.h40,
    dataRowMinHeight: ManagerHeight.h40,
    columnSpacing: ManagerWidth.w5,
    horizontalMargin: ManagerWidth.w10,
    columns: [
      dataColumnOfComplaintsTable(AppConstants.hash),
      dataColumnOfComplaintsTable(ManagerStrings.date),
      dataColumnOfComplaintsTable(ManagerStrings.complaint),
      dataColumnOfComplaintsTable(ManagerStrings.state),
    ],
    rows: rows,
  );
}
