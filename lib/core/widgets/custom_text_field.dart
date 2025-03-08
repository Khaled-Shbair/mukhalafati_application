import '/config/all_imports.dart';

class CustomTextField extends StatelessWidget with CustomToast {
  const CustomTextField({
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.datetime,
    this.changeObscureText,
    this.color,
    this.borderColor = ManagerColors.lightSilver,
    this.readOnly = false,
    this.maxLength,
    this.maxLines,
    this.contentPadding,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.textDirection,
    this.textInputAction,
    this.autofocus = false,
    this.minHeightConstraints,
    this.isFocus = false,
    this.expands = false,
    this.minLines,
    this.inputTextStyle,
    this.onEditingComplete,
    this.labelStyle,
    this.hintStyle,
    this.validator,
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
  final Function()? onEditingComplete;
  final Function()? onTap;

  final bool autofocus;
  final TextStyle? inputTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final double? minHeightConstraints;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final bool expands;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textDirection: textDirection,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enableInteractiveSelection: true,
      minLines: minLines ?? AppConstants.minLinesOfTextFormField,
      maxLines: maxLines ?? AppConstants.maxLinesOfTextFormField,
      autofocus: autofocus,
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      cursorErrorColor: context.theme.primaryColor,
      cursorRadius: Radius.circular(ManagerRadius.r10),
      expands: expands,
      keyboardType: keyboardType,
      cursorColor: context.theme.primaryColor,
      obscureText: obscureText,
      maxLength: maxLength,
      textAlign: textAlign,
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: inputTextStyle ??
          context.textTheme.textStyleOfInputTextFiled(context),
      decoration: InputDecoration(
        // errorStyle: TextStyle(
        //   color: Colors.transparent,
        //   height: 0,
        //   fontSize: 0,
        // ),
        errorStyle: context.theme.inputDecorationTheme.errorStyle,
        constraints: context.theme.inputDecorationTheme.constraints?.copyWith(
          minHeight: minHeightConstraints,
        ),
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
        errorBorder: context.theme.inputDecorationTheme.errorBorder,
        filled: context.theme.inputDecorationTheme.filled,
        errorMaxLines: context.theme.inputDecorationTheme.errorMaxLines,
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
