import '/config/all_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.height,
    this.minWidth,
    this.elevation,
    this.shape,
    this.side,
    this.borderRadius,
    this.highlightColor,
    this.splashColor,
    this.highlightElevation,
    this.padding,
    super.key,
  });

  final void Function() onPressed;
  final Color? backgroundColor;
  final Widget child;
  final double? height;
  final double? minWidth;
  final double? elevation;
  final ShapeBorder? shape;
  final BorderSide? side;
  final double? borderRadius;
  final Color? highlightColor;
  final Color? splashColor;
  final double? highlightElevation;
  final EdgeInsetsDirectional? padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor ?? context.theme.primaryColor,
      height: height ?? ManagerHeight.h48,
      minWidth: minWidth ?? ManagerWidth.infinity,
      elevation: elevation.onNull(),
      highlightColor: highlightColor,
      highlightElevation: highlightElevation.onNull(),
      focusColor: context.theme.unselectedWidgetColor,
      splashColor: splashColor,
      padding: padding,
      shape: shape ??
          RoundedRectangleBorder(
            side: side ??
                BorderSide(
                  color: context.theme.primaryColor,
                  width: AppConstants.sideOfBorderSideInMainButton,
                ),
            borderRadius:
                BorderRadius.circular(borderRadius ?? ManagerRadius.r5),
          ),
      child: child,
    );
  }
}
