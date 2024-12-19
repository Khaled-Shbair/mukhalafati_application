import '/config/all_imports.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    this.children,
    this.recognizer,
    this.fontWeight,
    this.color,
    this.fontSize,
    required this.title,
    super.key,
  });

  final List<InlineSpan>? children;
  final GestureRecognizer? recognizer;
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: customTextSpan(
        text: title,
        recognizer: recognizer,
        children: children,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        context: context,
      ),
    );
  }
}

TextSpan customTextSpan({
  required String text,
  GestureRecognizer? recognizer,
  List<InlineSpan>? children,
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  required BuildContext context,
}) {
  return TextSpan(
    text: text,
    recognizer: recognizer,
    style: context.textTheme.displaySmall!.copyWith(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
    ),
    children: children,
  );
}
