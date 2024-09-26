import '/config/all_imports.dart';

Widget mainTextField({
  required TextEditingController controller,
  String? labelText,
  String? hintText,
  bool obscureText = false,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.number,
  void Function()? changeObscureText,
  Color? color,
  double? fontSizeLabelText,
  FontWeight? fontWeightLabelText,
  Color? colorLabelText,
  Color borderColor = ManagerColors.lightSilver,
  bool readOnly = false,
  int? maxLength,
  int? maxLines,
  EdgeInsetsDirectional? contentPadding,
  FocusNode? focusNode,
  Function(String)? onChanged,
  Color? colorInputText,
  FontWeight? fontWeightInputText,
  double? fontSizeInputText,
  TextAlign textAlign = TextAlign.start,
}) {
  return TextFormField(
    maxLines: maxLines ?? 1,
    readOnly: readOnly,
    controller: controller,
    focusNode: focusNode,
    onChanged: onChanged,
    keyboardType: keyboardType,
    cursorColor: ManagerColors.primaryColor,
    obscureText: obscureText,
    maxLength: maxLength,
    textAlign: textAlign,
    style: TextStyle(
      color: colorInputText ?? ManagerColors.black,
      fontFamily: ManagerFontFamily.cairo,
      fontWeight: fontWeightInputText ?? ManagerFontWeight.regular,
      fontSize: fontSizeInputText ?? ManagerFontsSizes.f11,
    ),
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      contentPadding: contentPadding,
      counterText: '',
      fillColor: color ?? ManagerColors.transparent,
      filled: true,
      labelStyle: TextStyle(
        color: colorLabelText ?? ManagerColors.black50,
        fontWeight: fontWeightLabelText ?? ManagerFontWeight.medium,
        fontSize: fontSizeLabelText ?? ManagerFontsSizes.f11,
        fontFamily: ManagerFontFamily.cairo,
      ),
      hintStyle: TextStyle(
        color: colorLabelText ?? ManagerColors.black50,
        fontWeight: fontWeightLabelText ?? ManagerFontWeight.medium,
        fontSize: fontSizeLabelText ?? ManagerFontsSizes.f11,
        fontFamily: ManagerFontFamily.cairo,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: BorderSide(
          color: borderColor,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: BorderSide(
          color: borderColor,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: BorderSide(
          color: borderColor,
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
