import '/config/all_imports.dart';

class CustomNotInternetConnection extends StatelessWidget {
  const CustomNotInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: ManagerIconsSizes.i100,
            color: context.theme.primaryColor,
          ),
          verticalSpace(ManagerHeight.h10),
          Text(
            ManagerStrings.noInternetConnection,
            style: context.textTheme
                .textStyleOfCustomNotInternetConnection(context),
          ),
        ],
      ),
    );
  }
}
