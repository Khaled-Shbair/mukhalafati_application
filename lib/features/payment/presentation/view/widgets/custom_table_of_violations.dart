import '/config/all_imports.dart';

class CustomTableOfViolations extends StatelessWidget {
  const CustomTableOfViolations({
    required this.scrollController,
    required this.namesOfColumns,
    required this.viewViolations,
    required this.onTap,
    super.key,
  });

  final ScrollController scrollController;
  final List<String> namesOfColumns;
  final List<DriverViolationsDataModel> viewViolations;
  final Function({
    required String date,
    required String numberOfViolation,
    required String price,
    required String placeOfViolation,
    required String timeOfViolation,
    required String reasonForViolation,
    required int violationId,
    required bool isPaid,
    required BuildContext context,
  }) onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        shrinkWrap: true,
        controller: scrollController,
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h20,
        ),
        primary: false,
        children: [
          CustomTable(
            columns: [
              ...List.generate(
                namesOfColumns.length,
                (index) => customDataColumn(
                  namesOfColumns[index],
                  context,
                ),
              ),
            ],
            rows: [
              ...List.generate(
                viewViolations.length,
                (index) {
                  var data = viewViolations[index];
                  return _dataRowOfViolationTable(
                    context: context,
                    numberOfRow: (index + 1).toString(),
                    price: data.priceOfViolation.toString(),
                    date: data.violationDate,
                    isPaid: data.violationState,
                    onTap: () => onTap(
                        isPaid: data.violationState,
                        numberOfViolation: data.id.toString(),
                        reasonForViolation: data.violationReason,
                        placeOfViolation: data.violationAddress,
                        timeOfViolation: data.violationTime,
                        violationId: data.id,
                        price: data.priceOfViolation.toString(),
                        date: data.violationDate,
                        context: context),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

DataRow _dataRowOfViolationTable({
  required bool isPaid,
  required String price,
  required String date,
  required String numberOfRow,
  Function()? onTap,
  required BuildContext context,
}) {
  return DataRow(
    cells: [
      _myDataCell(numberOfRow, context),
      _myDataCell(date, context, ManagerWidth.w74),
      _myDataCell('$price ${ManagerStrings.shekel}', context, ManagerWidth.w80),
      DataCell(
        onTap: onTap,
        Container(
          alignment: AlignmentDirectional.center,
          height: ManagerHeight.h26,
          width: ManagerWidth.w60,
          decoration: BoxDecoration(
            color: isPaid
                ? context.theme.colorScheme.surfaceContainer
                : context.theme.colorScheme.onSecondaryContainer,
            borderRadius: BorderRadius.circular(ManagerRadius.r5),
          ),
          child: Text(
            isPaid ? ManagerStrings.paid : ManagerStrings.unpaid,
            style:
                context.textTheme.textStyleOfStatusOfViolation(context, isPaid),
          ),
        ),
      ),
    ],
  );
}

DataCell _myDataCell(String text, BuildContext context, [double? width]) {
  return DataCell(
    SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textTheme.textStyleOfDataRowInTableViolation(context),
      ),
    ),
  );
}
