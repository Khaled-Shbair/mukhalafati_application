import '/config/all_imports.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    this.children,
    this.recognizer,
    required this.title,
    required this.textStyle,
    super.key,
  });

  final List<InlineSpan>? children;
  final GestureRecognizer? recognizer;
  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: customTextSpan(
        text: title,
        recognizer: recognizer,
        children: children,
        textStyle: textStyle,
        context: context,
      ),
    );
  }
}

TextSpan customTextSpan({
  required String text,
  GestureRecognizer? recognizer,
  List<InlineSpan>? children,
  required TextStyle textStyle,
  required BuildContext context,
}) {
  return TextSpan(
    text: text,
    recognizer: recognizer,
    style: textStyle,
    children: children,
  );
}
