import '/config/all_imports.dart';

Widget boxOfNumberOfViolationDriver({
  required bool isPaid,
  required int counter,
}) {
  return Container(
    height: ManagerHeight.h112,
    width: ManagerWidth.w162,
    alignment: AlignmentDirectional.center,
    margin: EdgeInsetsDirectional.only(
      bottom: ManagerHeight.h36,
    ),
    decoration: BoxDecoration(
      color: isPaid ? ManagerColors.grannySmithApple : ManagerColors.begonia,
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        isPaid
            ? Icon(
                Icons.attach_money,
                color: ManagerColors.mayGreen,
                size: ManagerIconsSizes.i34,
              )
            : Image.asset(
                ManagerAssets.warningIcon,
                height: ManagerHeight.h34,
                width: ManagerWidth.w34,
                fit: BoxFit.cover,
              ),
        SizedBox(height: ManagerHeight.h5),
        Text(
          '$counter ${isPaid ? ManagerStrings.paid : ManagerStrings.unpaid}',
          style: TextStyle(
            fontFamily: ManagerFontFamily.cairo,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f15,
            color: isPaid
                ? ManagerColors.mayGreen
                : ManagerColors.bittersweetShimmer,
          ),
        ),
      ],
    ),
  );
}
