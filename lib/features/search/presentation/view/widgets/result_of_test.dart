import '/config/all_imports.dart';

Widget resultOfTest({
  required String testType,
  bool isSuccessful = true,
}) {
  return Container(
    height: ManagerHeight.h112,
    width: ManagerWidth.infinity,
    margin: EdgeInsetsDirectional.only(
      bottom: ManagerHeight.h15,
    ),
    decoration: BoxDecoration(
      color:
          isSuccessful ? ManagerColors.grannySmithApple : ManagerColors.begonia,
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          testType,
          style: TextStyle(
            fontFamily: ManagerFontFamily.cairo,
            color: isSuccessful
                ? ManagerColors.successColor
                : ManagerColors.bittersweetShimmer,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f13,
          ),
        ),
        Text(
          isSuccessful ? ManagerStrings.successful : ManagerStrings.failed,
          style: TextStyle(
            fontFamily: ManagerFontFamily.cairo,
            color: isSuccessful
                ? ManagerColors.successColor
                : ManagerColors.bittersweetShimmer,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f18,
          ),
        ),
      ],
    ),
  );
}
