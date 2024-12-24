import '/config/all_imports.dart';

DataRow dataRowOfViolationTable({
  required bool isPaid,
  required String price,
  required String date,
  required String numberOfRow,
  Function()? onTap,
}) {
  return DataRow(
    cells: [
      _myDataCell(numberOfRow),
      _myDataCell(date, ManagerWidth.w74),
      _myDataCell('$price ${ManagerStrings.shekel}', ManagerWidth.w80),
      DataCell(
        onTap: onTap,
        Container(
          alignment: AlignmentDirectional.center,
          height: ManagerHeight.h26,
          width: ManagerWidth.w60,
          decoration: BoxDecoration(
            color:
                isPaid ? ManagerColors.grannySmithApple : ManagerColors.begonia,
            borderRadius: BorderRadius.circular(ManagerRadius.r5),
          ),
          child: Text(
            isPaid ? ManagerStrings.paid : ManagerStrings.unpaid,
            style: TextStyle(
              color: isPaid
                  ? ManagerColors.successColor
                  : ManagerColors.bittersweetShimmer,
              fontFamily: ManagerFontFamily.cairo,
              fontSize: ManagerFontsSizes.f9, //12
              fontWeight: ManagerFontWeight.semiBold,
            ),
          ),
        ),
      ),
    ],
  );
}

DataCell _myDataCell(String text, [double? width]) {
  return DataCell(
    SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ManagerColors.black50,
          fontFamily: ManagerFontFamily.cairo,
          fontWeight: ManagerFontWeight.semiBold,
          fontSize: ManagerFontsSizes.f12,
        ),
      ),
    ),
  );
}
