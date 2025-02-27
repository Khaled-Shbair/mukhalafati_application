import '/config/all_imports.dart';

class CustomExpansionTileCard extends StatelessWidget {
  const CustomExpansionTileCard({
    required this.onExpansionChanged,
    required this.title,
    required this.isOpen,
    required this.children,
    super.key,
  });

  final Function(bool value) onExpansionChanged;
  final String title;
  final bool isOpen;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      minTileHeight: ManagerHeight.h50,
      shape: context.theme.expansionTileTheme.shape,
      collapsedShape: context.theme.expansionTileTheme.collapsedShape,
      textColor: context.theme.expansionTileTheme.textColor,
      showTrailingIcon: false,
      collapsedTextColor: context.theme.expansionTileTheme.collapsedTextColor,
      backgroundColor: context.theme.expansionTileTheme.backgroundColor,
      collapsedBackgroundColor:
          context.theme.expansionTileTheme.collapsedBackgroundColor,
      onExpansionChanged: onExpansionChanged,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: ManagerFontFamily.cairo,
          fontWeight:
              isOpen ? ManagerFontWeight.bold : ManagerFontWeight.semiBold,
          fontSize: ManagerFontsSizes.f12,
        ),
      ),
      children: children,
    );
  }
}
