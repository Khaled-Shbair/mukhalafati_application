import '/config/all_imports.dart';

Widget menuButton(Function() onPressed) {
  return CustomButton(
    onPressed: onPressed,
    minWidth: ManagerWidth.w30,
    height: ManagerHeight.h30,
    backgroundColor: ManagerColors.transparent,
    highlightColor: ManagerColors.transparent,
    splashColor: ManagerColors.transparent,
    side: BorderSide.none,
    child: Icon(
      Icons.menu,
      color: ManagerColors.black,
      size: ManagerIconsSizes.i30,
    ),
  );
}
