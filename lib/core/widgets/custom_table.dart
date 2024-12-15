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
      headingRowHeight: ManagerHeight.h40,
      dataRowMinHeight: ManagerHeight.h40,
      horizontalMargin: ManagerWidth.w10,
      columnSpacing: ManagerWidth.w5,

      //TODO: this line used form tableOfViolation (edit later)
      // columnSpacing: rows.isNotEmpty ? ManagerWidth.w14 : null,

      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.dividerColor,
          width: ManagerWidth.w1,
        ),
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
      columns: columns,
      rows: rows,
    );
  }
}

DataColumn dataColumn(String text) {
  return DataColumn(
    headingRowAlignment: MainAxisAlignment.center,
    label: textDataColumn(text),
  );
}

Widget textDataColumn(String text) {
  return Text(
    text,
    style: TextStyle(
      color: ManagerColors.black70,
      fontFamily: ManagerFontFamily.cairo,
      fontWeight: ManagerFontWeight.semiBold,
      fontSize: ManagerFontsSizes.f12,
    ),
  );
}

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
        color: ManagerColors.transparent,
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
                  (index) => textDataColumn(nameOfColumns[index]),
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
            style: TextStyle(
              color: ManagerColors.black,
              fontFamily: ManagerFontFamily.cairo,
              fontSize: ManagerFontsSizes.f12,
              fontWeight: ManagerFontWeight.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
