import '/config/all_imports.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: child,
    );
  }
}
