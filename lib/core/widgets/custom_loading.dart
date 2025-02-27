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

void customLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: ManagerColors.black70,
    builder: (context) {
      return Center(
        child: SizedBox(
          height: ManagerHeight.h60,
          width: ManagerWidth.w60,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w10,
                end: ManagerWidth.w10,
                top: ManagerHeight.h10,
                bottom: ManagerHeight.h10,
              ),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    },
  );
}

