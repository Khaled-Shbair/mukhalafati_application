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
      children: [
        isPaid
            ? SizedBox(
                height: ManagerHeight.h36,
                child: Icon(
                  Icons.attach_money,
                  color: ManagerColors.mayGreen,
                  size: ManagerIconsSizes.i34,
                ),
              )
            : SizedBox(
                height: ManagerHeight.h36,
                child: Text(
                  AppConstants.exclamationMark,
                  style: TextStyle(
                    color: ManagerColors.bittersweetShimmer,
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontsSizes.f32,
                    height: ManagerHeight.h0,
                  ),
                ),
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
        // if (!isPaid) ...{SizedBox(height: ManagerHeight.h10)},
      ],
    ),
  );
}
