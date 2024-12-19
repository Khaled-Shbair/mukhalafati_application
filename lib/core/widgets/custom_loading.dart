import 'dart:io';

import '/config/all_imports.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? loadingAndroid(context) : loadingIos();
  }

  loadingAndroid(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.theme.progressIndicatorTheme.color,
      ),
    );
  }

//TODO: Search on loading of ios and added
  loadingIos() {
    return Center(
      child: CircularProgressIndicator(
          // color: context.theme.progressIndicatorTheme.color,
          ),
    );
  }
}
