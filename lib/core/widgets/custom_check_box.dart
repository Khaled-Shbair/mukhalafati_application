import '/config/all_imports.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final Function(bool? v) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          ManagerStrings.rememberMe,
          style: context.textTheme.forgotPasswordButtonAndTextOfCheckBoxInLoginScreen(context),
        ),
      ],
    );
  }
}
