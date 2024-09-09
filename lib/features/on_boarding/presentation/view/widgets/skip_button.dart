import '/config/all_imports.dart';

Widget skipButton({
  required bool visible,
  required void Function() onPressed,
}) {
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: visible,
    child: MaterialButton(
      padding: EdgeInsetsDirectional.zero,
      highlightColor: ManagerColors.transparent,
      splashColor: ManagerColors.transparent,
      focusColor: ManagerColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: onPressed,
      child: Text(
        ManagerStrings.skip,
        style: TextStyle(
          fontSize: ManagerFontsSizes.f14,
          fontWeight: ManagerFontWeight.bold,
          color: ManagerColors.dimGray,
          fontFamily: ManagerFontFamily.cairo,
        ),
      ),
    ),
  );
}
