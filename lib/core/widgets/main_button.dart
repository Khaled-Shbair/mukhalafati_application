import '/config/all_imports.dart';

Widget mainButton({
  required void Function() onPressed,
  Color? color,
  required Widget child,
  double? height,
  double? minWidth,
  double? elevation,
  ShapeBorder? shape,
  BorderSide? side,
  double? borderRadius,
  Color? highlightColor,
  Color? splashColor,
  double? highlightElevation,
}) {
  return MaterialButton(
    onPressed: onPressed,
    color: color ?? ManagerColors.primaryColor,
    height: height ?? ManagerHeight.h48,
    minWidth: minWidth ?? ManagerWidth.infinity,
    elevation: elevation.onNull(),
    highlightColor: highlightColor,
    highlightElevation: highlightElevation.onNull(),
    focusColor: Colors.transparent,
    splashColor: splashColor,
    shape: shape ??
        RoundedRectangleBorder(
          side: side ??
              const BorderSide(
                color: ManagerColors.primaryColor,
                width: AppConstants.sideOfBorderSideInMainButton,
              ),
          borderRadius: BorderRadius.circular(borderRadius ?? ManagerRadius.r5),
        ),
    child: child,
  );
}
