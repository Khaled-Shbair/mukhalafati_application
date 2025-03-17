import '/config/all_imports.dart';

class CustomFilterViolationsItem extends StatelessWidget {
  const CustomFilterViolationsItem({
    required this.title,
    required this.onChangedCheckBoxFirst,
    required this.onChangedCheckBoxSecond,
    required this.titleCheckBoxFirst,
    required this.titleCheckBoxSecond,
    required this.valueCheckBoxFirst,
    required this.valueCheckBoxSecond,
    super.key,
  });

  final String title;
  final String titleCheckBoxFirst;
  final String titleCheckBoxSecond;
  final bool valueCheckBoxFirst;
  final bool valueCheckBoxSecond;
  final void Function() onChangedCheckBoxFirst;
  final void Function() onChangedCheckBoxSecond;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.textStyleOfTitleTypeOfFilter(),
        ),
        verticalSpace(ManagerHeight.h8),
        _CustomCheckBoxOfFilterViolations(
          onTap: onChangedCheckBoxFirst,
          isChecked: valueCheckBoxFirst,
          title: titleCheckBoxFirst,
        ),
        verticalSpace(ManagerHeight.h8),
        _CustomCheckBoxOfFilterViolations(
          onTap: onChangedCheckBoxSecond,
          isChecked: valueCheckBoxSecond,
          title: titleCheckBoxSecond,
        ),
      ],
    );
  }
}

class _CustomCheckBoxOfFilterViolations extends StatelessWidget {
  const _CustomCheckBoxOfFilterViolations({
    required this.isChecked,
    required this.title,
    required this.onTap,
  });

  final bool isChecked;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Icon(
            isChecked ? Icons.check_box : Icons.check_box_outline_blank,
            size: ManagerIconsSizes.i22,
            color: isChecked
                ? context.theme.primaryColor
                : context.theme.colorScheme.inverseSurface,
          ),
        ),
        horizontalSpace(ManagerWidth.w2),
        Text(
          title,
          style: context.textTheme.textStyleOfSubTitleDriverViolationsScreen(),
        ),
      ],
    );
  }
}
