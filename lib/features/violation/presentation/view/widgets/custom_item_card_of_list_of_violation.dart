import '/config/all_imports.dart';

class CustomItemCardOfListOfViolation extends StatelessWidget {
  const CustomItemCardOfListOfViolation({
    required this.text,
    required this.icon,
    this.trailing,
    super.key,
  });

  final String text;
  final IconData icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: ManagerHeight.h5,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: context.theme.listTileTheme.iconColor,
            size: ManagerIconsSizes.i24,
          ),
          horizontalSpace(ManagerWidth.w10),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.textStyleOfDateOfListOfViolation(context),
          ),
        ],
      ),
    );
  }
}
