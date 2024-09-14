import '/config/all_imports.dart';

Widget richText({
  List<InlineSpan>? children,
  GestureRecognizer? recognizer,
  String? title,
  Color? color,
  double? fontSize,
}) {
  return RichText(
    text: textSpan(
      text: title,
      recognizer: recognizer,
      children: children,
      color: color,
      fontSize: fontSize,
    ),
  );
}

TextSpan textSpan({
  String? text,
  GestureRecognizer? recognizer,
  List<InlineSpan>? children,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
  Color? color,
}) {
  return TextSpan(
    text: text,
    recognizer: recognizer,
    style: TextStyle(
      color: color ?? ManagerColors.gunmetal,
      fontFamily: fontFamily ?? ManagerFontFamily.cairo,
      fontWeight: fontWeight ?? ManagerFontWeight.medium,
      fontSize: fontSize ?? ManagerFontsSizes.f15,
    ),
    children: children,
  );
}
