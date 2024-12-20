import '/config/all_imports.dart';

class CustomIncorrectEnteredCodeMessage extends StatelessWidget {
  const CustomIncorrectEnteredCodeMessage({
    required this.isIncorrect,
    super.key,
  });

  final bool isIncorrect;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isIncorrect,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      maintainInteractivity: true,
      maintainSemantics: true,
      child: Text(
        ManagerStrings.theEnteredCodeIsIncorrect,
        style: context.textTheme.labelSmall,
      ),
    );
  }
}
