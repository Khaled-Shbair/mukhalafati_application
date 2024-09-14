import '/config/all_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                ManagerAssets.backgroundSplashScreen,
                height: ManagerHeight.infinity,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ManagerAssets.logoSplash,
                height: ManagerHeight.h120,
                width: ManagerWidth.w120,
              ),
            ],
          );
        },
      ),
    );
  }
}
