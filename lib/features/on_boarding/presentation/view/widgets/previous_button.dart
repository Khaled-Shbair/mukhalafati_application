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
      icon: const Icon(
        Icons.arrow_forward_ios,
        color: ManagerColors.darkPurple,
        size: 20,
      ),
    ),
  );
}
