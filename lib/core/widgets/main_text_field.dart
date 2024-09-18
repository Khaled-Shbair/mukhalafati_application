import '/config/all_imports.dart';

Widget mainTextField({
  required TextEditingController controller,
  required String labelText,
  bool obscureText = false,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.number,
  void Function()? changeObscureText,
  Color? color,
  double? fontSizeLabelText,
  Color? colorLabelText,
  bool readOnly = false,
  int? maxLength,
  int? maxLines,
}) {
  return TextFormField(
    maxLines: maxLines ?? 1,
    readOnly: readOnly,
    controller: controller,
    keyboardType: keyboardType,
    cursorColor: ManagerColors.primaryColor,
    obscureText: obscureText,
    maxLength: maxLength,
    style: TextStyle(
      color: ManagerColors.black,
      fontFamily: ManagerFontFamily.cairo,
      fontWeight: ManagerFontWeight.regular,
      fontSize: ManagerFontsSizes.f11,
    ),
    decoration: InputDecoration(
      labelText: labelText,
      counterText: '',
      fillColor: color ?? ManagerColors.transparent,
      filled: true,
      labelStyle: TextStyle(
        color: colorLabelText ?? ManagerColors.black50,
        fontWeight: ManagerFontWeight.medium,
        fontSize: fontSizeLabelText ?? ManagerFontsSizes.f11,
        fontFamily: ManagerFontFamily.cairo,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: const BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: const BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: const BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      suffixIcon: isPassword
          ? IconButton(
              onPressed: changeObscureText,
              highlightColor: ManagerColors.transparent,
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: ManagerColors.lightSilver,
              ),
            )
          : null,
    ),
  );
}
