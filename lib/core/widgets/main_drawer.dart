import '/config/all_imports.dart';

class CustomMainDrawer extends StatelessWidget {
  const CustomMainDrawer({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.drawerTheme.backgroundColor,
      width: context.theme.drawerTheme.width,
      shape: context.theme.drawerTheme.shape,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.zero,
        children: children,
      ),
    );
  }
}

class CustomButtonOfMainDrawer extends StatelessWidget {
  const CustomButtonOfMainDrawer({
    required this.onPressed,
    required this.icon,
    required this.title,
    this.heightIcon,
    this.widthIcon,
    super.key,
  });

  final Function() onPressed;
  final String icon;
  final String title;
  final double? heightIcon;
  final double? widthIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Image.asset(
        icon,
        height: heightIcon ?? ManagerHeight.h24,
        width: widthIcon ?? ManagerWidth.w24,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: context.theme.listTileTheme.titleTextStyle,
      ),
      style: context.theme.listTileTheme.style,
      contentPadding: context.theme.listTileTheme.contentPadding,
    );
  }
}
