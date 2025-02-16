import '/config/all_imports.dart';

class MoveButton extends StatelessWidget {
  const MoveButton({
    required this.value,
    required this.onPressed,
    super.key,
  });

  final double? value;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: ManagerHeight.h55,
          width: ManagerWidth.w55,
          child: CircularProgressIndicator(
            color: context.theme.progressIndicatorTheme.color,
            backgroundColor:
                context.theme.progressIndicatorTheme.refreshBackgroundColor,
            value: value,
            strokeWidth: AppConstants.strokeWidthOfCircularProgressIndicator,
          ),
        ),
        CustomButton(
          onPressed: onPressed,
          shape: const CircleBorder(),
          height: ManagerHeight.h49,
          child: Icon(
            Icons.arrow_forward,
            color: context.theme.iconTheme.color,
            size: context.theme.iconTheme.size,
          ),
        ),
      ],
    );
  }
}
