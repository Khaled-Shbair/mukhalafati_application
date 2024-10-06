import '/config/all_imports.dart';

Widget filedOfVerificationCode({
  required TextEditingController controller,
  required FocusNode focusNode,
  required Function(String)? onChanged,
  required bool changeBorderColor,
}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsetsDirectional.only(
        end: ManagerWidth.w20,
        bottom: ManagerHeight.h10,
      ),
      child: mainTextField(
        controller: controller,
        autofocus: true,
        maxLength: AppConstants.maxLengthOfVerificationCode,
        textAlign: TextAlign.center,
        focusNode: focusNode,
        onChanged: onChanged,
        colorInputText: ManagerColors.primaryColor,
        fontWeightInputText: ManagerFontWeight.bold,
        fontSizeInputText: ManagerFontsSizes.f25,
        borderColor: changeBorderColor
            ? ManagerColors.primaryColor
            : ManagerColors.lightSilver,
        contentPadding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h10,
          bottom: ManagerHeight.h10,
        ),
      ),
    ),
  );
}
