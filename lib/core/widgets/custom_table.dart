import '/config/all_imports.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    required this.rows,
    required this.columns,
    super.key,
  });

  final List<DataRow> rows;
  final List<DataColumn> columns;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowHeight: context.theme.dataTableTheme.headingRowHeight,
      dataRowMinHeight: context.theme.dataTableTheme.dataRowMinHeight,
      horizontalMargin: context.theme.dataTableTheme.horizontalMargin,
      columnSpacing: context.theme.dataTableTheme.columnSpacing,
      decoration: context.theme.dataTableTheme.decoration,
      columns: columns,
      rows: rows,
    );
  }
}

DataColumn customDataColumn(String nameColumn, BuildContext context) {
  return DataColumn(
    headingRowAlignment: context.theme.dataTableTheme.headingRowAlignment,
    label: CustomNameColumnInTable(nameColumn: nameColumn),
  );
}

/// Custom name column (heading) used in table
class CustomNameColumnInTable extends StatelessWidget {
  const CustomNameColumnInTable({
    required this.nameColumn,
    super.key,
  });

  final String nameColumn;

  @override
  Widget build(BuildContext context) {
    return Text(
      nameColumn,
      style: context.theme.dataTableTheme.headingTextStyle,
    );
  }
}

/// Appear when no data return from [Api]
class CustomEmptyTable extends StatelessWidget {
  const CustomEmptyTable({
    required this.length,
    required this.nameOfColumns,
    super.key,
  });

  final int length;
  final List<String> nameOfColumns;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidth.w287,
      alignment: AlignmentDirectional.center,
      padding: EdgeInsetsDirectional.only(
        top: ManagerHeight.h10,
        bottom: ManagerHeight.h30,
      ),
      decoration: BoxDecoration(
        color: context.theme.unselectedWidgetColor,
        border: Border.all(
          color: context.theme.dividerColor,
          width: ManagerWidth.w1,
        ),
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: ManagerHeight.h4,
              start: ManagerWidth.w10,
              end: ManagerWidth.w20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  length,
                  (index) =>
                      CustomNameColumnInTable(nameColumn: nameOfColumns[index]),
                ),
              ],
            ),
          ),
          Divider(
            color: context.theme.dividerColor,
            thickness: ManagerHeight.h1,
          ),
          verticalSpace(ManagerHeight.h20),
          Text(
            ManagerStrings.noRecordedViolations,
            textAlign: TextAlign.center,
            style: context.textTheme.titleListOfComplaintsScreenAndStyleOfTextInEmptyTable(context),
          ),
        ],
      ),
    );
  }
}
