import '/config/all_imports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        initOnBoarding();
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.noRouteFound),
        ),
        body: Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
