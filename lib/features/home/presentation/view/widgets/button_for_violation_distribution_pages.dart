import '/config/all_imports.dart';

Widget buttonForViolationDistributionPages({
  required String text,
  bool isSelected = false,
  required Function() onTap,
}) {
  return mainButton(
    onPressed: onTap,
    color: isSelected ? ManagerColors.primaryColor : ManagerColors.transparent,
    side: BorderSide(
      color: ManagerColors.primaryColor,
      width: ManagerHeight.h1,
    ),
    highlightColor: ManagerColors.transparent,
    splashColor: ManagerColors.transparent,
    child: Text(
      text,
      style: isSelected
          ? TextStyle(
              color: ManagerColors.white,
              fontFamily: ManagerFontFamily.cairo,
              fontWeight: ManagerFontWeight.bold,
              fontSize: ManagerFontsSizes.f13,
            )
          : TextStyle(
              color: ManagerColors.primaryColor,
              fontFamily: ManagerFontFamily.cairo,
              fontWeight: ManagerFontWeight.semiBold,
              fontSize: ManagerFontsSizes.f13,
            ),
    ),
  );
}
/*
Container(
    alignment: AlignmentDirectional.center,
    padding: EdgeInsetsDirectional.only(
      bottom: ManagerHeight.h12,
      top: ManagerHeight.h12,
    ),
    decoration: BoxDecoration(
      color: ManagerColors.transparent,
      border: Border.all(
        color: ManagerColors.primaryColor,
        width: ManagerHeight.h1,
      ),
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    child: Text(text),
  );
 */
