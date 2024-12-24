import '/config/all_imports.dart';

class CustomButtonForViolationDistributionPages extends StatelessWidget {
  const CustomButtonForViolationDistributionPages({
    required this.text,
    this.isSelected = false,
    required this.onTap,
    super.key,
  });

  final String text;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onTap,
      backgroundColor: isSelected
          ? context.theme.primaryColor
          : context.theme.unselectedWidgetColor,
      side: BorderSide(
        color: context.theme.primaryColor,
        width: ManagerHeight.h1,
      ),
      highlightColor: context.theme.unselectedWidgetColor,
      splashColor: context.theme.unselectedWidgetColor,
      child: Text(
        text,
        style: isSelected
            ? context.textTheme
                .selectedCustomButtonForViolationDistributionPages(context)
            : context.textTheme
                .unSelectedCustomButtonForViolationDistributionPages(context),
      ),
    );
  }
}
