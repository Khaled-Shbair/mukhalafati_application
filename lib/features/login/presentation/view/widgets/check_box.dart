import '/config/all_imports.dart';

Widget checkBox({
  required bool value,
  required Function(bool? v) onChanged,
}) {
  return Row(
    children: [
      Checkbox(
        hoverColor: Colors.green,
        focusColor: Colors.blue,
        value: value,
        onChanged: onChanged,
        checkColor: ManagerColors.white,
        activeColor: ManagerColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
        ),
        side: const BorderSide(
          color: ManagerColors.philippineGray,
          width: 1.5,
        ),
        splashRadius: AppConstants.splashRadiusOfCheckboxInLoginScreen,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      Text(
        ManagerStrings.rememberMe,
        style: TextStyle(
          fontFamily: ManagerFontFamily.cairo,
          fontSize: ManagerFontsSizes.f13,
          fontWeight: ManagerFontWeight.medium,
          color: ManagerColors.philippineGray,
        ),
      ),
    ],
  );
}
