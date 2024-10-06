import '/config/all_imports.dart';

Widget previousButton({
  required bool visible,
  required void Function() onPressed,
}) {
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: visible,
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: ManagerColors.darkPurple,
        size: ManagerIconsSizes.i20,
      ),
    ),
  );
}
