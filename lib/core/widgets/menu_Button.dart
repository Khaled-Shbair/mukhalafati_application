import '/config/all_imports.dart';

Widget menuButton(Function() onPressed) {
  return mainButton(
    onPressed: onPressed,
    minWidth: ManagerWidth.w30,
    height: ManagerHeight.h30,
    color: ManagerColors.transparent,
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
