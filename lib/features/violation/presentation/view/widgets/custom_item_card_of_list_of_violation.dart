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
    return ListTile(
      leading: Icon(
        icon,
        color: context.theme.listTileTheme.iconColor,
        size: ManagerIconsSizes.i24,
      ),
      title: Text(
        text,
        style: context.theme.listTileTheme.titleTextStyle?.copyWith(
          fontSize: ManagerFontsSizes.f11,
        ),
      ),
      trailing: trailing,
      minTileHeight: context.theme.listTileTheme.minTileHeight,
    );
  }
}
