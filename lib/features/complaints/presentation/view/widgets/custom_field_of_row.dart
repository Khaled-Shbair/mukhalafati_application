import '/config/all_imports.dart';

DataCell customFieldOfRow(
  String text, {
  double start = 0.0,
  double end = 0.0,
  bool placeholder = false,
  required BuildContext context,
}) {
  return DataCell(
    placeholder: placeholder,
    Padding(
      padding: EdgeInsetsDirectional.only(
        start: start,
        end: end,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.theme.dataTableTheme.dataTextStyle,
      ),
    ),
  );
}
