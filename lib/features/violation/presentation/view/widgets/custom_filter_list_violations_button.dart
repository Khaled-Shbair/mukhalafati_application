import '/config/all_imports.dart';

class CustomFilterListViolationsButton extends StatelessWidget {
  const CustomFilterListViolationsButton({
    required this.child,
    this.marginEnd = 0.0,
    super.key,
  });

  final double marginEnd;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsetsDirectional.only(
          end: marginEnd,
        ),
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h5,
          bottom: ManagerHeight.h5,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.outline,
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
        ),
        child: child,
      ),
    );
  }
}
