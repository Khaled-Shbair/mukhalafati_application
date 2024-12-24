import '/config/all_imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.datetime,
    this.changeObscureText,
    this.color,
    // this.colorLabelText,
    this.borderColor = ManagerColors.lightSilver,
    this.readOnly = false,
    this.maxLength,
    this.maxLines,
    this.contentPadding,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.autofocus = false,
    this.maxHeightConstraints,
    this.isFocus = false,
    this.minLines,
    this.inputTextStyle,
    this.labelStyle,
    this.hintStyle,
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
  final bool isFocus;
  final Color borderColor;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsDirectional? contentPadding;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;

  final bool autofocus;
  final TextStyle? inputTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final double? maxHeightConstraints;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      minLines: minLines ?? AppConstants.minLinesOfTextFormField,
      maxLines: maxLines ?? AppConstants.maxLinesOfTextFormField,
      autofocus: autofocus,
      readOnly: readOnly,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: context.theme.primaryColor,
      obscureText: obscureText,
      maxLength: maxLength,
      textAlign: textAlign,
      style: inputTextStyle ??
          context.textTheme.textStyleOfInputTextFiled(context),
      decoration: InputDecoration(
        constraints: context.theme.inputDecorationTheme.constraints
            ?.copyWith(minHeight: maxHeightConstraints),
        labelText: labelText,
        hintText: hintText,
        contentPadding: contentPadding,
        counterText: '',
        fillColor: color ?? context.theme.inputDecorationTheme.fillColor,
        labelStyle: labelStyle ?? context.theme.inputDecorationTheme.labelStyle,
        hintStyle: hintStyle ?? context.theme.inputDecorationTheme.hintStyle,
        enabledBorder: context.theme.inputDecorationTheme.border
            ?.copyWith(borderSide: BorderSide(color: borderColor)),
        focusedBorder: context.theme.inputDecorationTheme.border
            ?.copyWith(borderSide: BorderSide(color: borderColor)),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: changeObscureText,
                highlightColor: context.theme.unselectedWidgetColor,
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: context.theme.inputDecorationTheme.suffixIconColor,
                ),
              )
            : null,
      ),
    );
  }
}
