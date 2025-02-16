import '/config/all_imports.dart';

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton(this.onPressed, {super.key});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      minWidth: ManagerWidth.w30,
      height: ManagerHeight.h30,
      backgroundColor: context.theme.unselectedWidgetColor,
      highlightColor: context.theme.unselectedWidgetColor,
      splashColor: context.theme.unselectedWidgetColor,
      side: BorderSide.none,
      child: Icon(
        Icons.menu,
        color: ManagerColors.black,
        size: ManagerIconsSizes.i30,
      ),
    );
  }
}
