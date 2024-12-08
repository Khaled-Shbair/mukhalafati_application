import '/config/all_imports.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.datetime,
    this.changeObscureText,
    this.color,
    this.fontSizeLabelText,
    this.fontWeightLabelText = ManagerFontWeight.medium,
    this.colorLabelText = ManagerColors.black50,
    this.borderColor = ManagerColors.lightSilver,
    this.readOnly = false,
    this.maxLength,
    this.maxLines,
    this.contentPadding,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.colorInputText,
    this.fontWeightInputText,
    this.fontSizeInputText,
    this.autofocus = false,
    this.minHeightConstraints,
    this.maxHeightConstraints,
    this.textAlign = TextAlign.start,
    super.key,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool isPassword;

  final TextInputType keyboardType;

  final void Function()? changeObscureText;
  final Color? color;
  final double? fontSizeLabelText;
  final FontWeight? fontWeightLabelText;
  final Color? colorLabelText;
  final Color borderColor;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final EdgeInsetsDirectional? contentPadding;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Color? colorInputText;
  final FontWeight? fontWeightInputText;
  final double? fontSizeInputText;
  final bool autofocus;

  final double? minHeightConstraints;
  final double? maxHeightConstraints;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      minLines: AppConstants.minLinesOfTextFormField,
      maxLines: maxLines ?? AppConstants.maxLinesOfTextFormField,
      autofocus: autofocus,
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
        constraints: BoxConstraints(
          minHeight: minHeightConstraints ?? ManagerHeight.h48,
          maxHeight: maxHeightConstraints ?? ManagerHeight.h48,
        ),
        labelText: labelText,
        hintText: hintText,
        contentPadding: contentPadding,
        counterText: '',
        fillColor: color ?? ManagerColors.transparent,
        filled: true,
        labelStyle: TextStyle(
          color: colorLabelText,
          fontWeight: fontWeightLabelText,
          fontSize: fontSizeLabelText ?? ManagerFontsSizes.f11,
          fontFamily: ManagerFontFamily.cairo,
        ),
        hintStyle: TextStyle(
          color: colorLabelText,
          fontWeight: fontWeightLabelText,
          fontSize: fontSizeLabelText ?? ManagerFontsSizes.f11,
          fontFamily: ManagerFontFamily.cairo,
        ),
        enabledBorder: _border(borderColor),
        border: _border(borderColor),
        focusedBorder: _border(borderColor),
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
}

OutlineInputBorder _border(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(ManagerRadius.r5),
    borderSide: BorderSide(
      color: borderColor,
      width: AppConstants.widthOfBorderSideOfMainTextField,
    ),
  );
}
