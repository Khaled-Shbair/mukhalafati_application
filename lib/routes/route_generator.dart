
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
      case Routes.welcomeScreen:
        initWelcome();
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.loginScreen:
        initLogin();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case Routes.logoutScreen:
        initLogout();
        return MaterialPageRoute(builder: (_) => const LogoutScreen());
      case Routes.policeManHomeScreen:
        initPoliceManHome();
        return MaterialPageRoute(builder: (_) => const PoliceManHomeScreen());
      case Routes.createViolationScreen:
        initCreateViolation();
        return MaterialPageRoute(builder: (_) => const CreateViolationScreen());
      case Routes.listOfViolationsScreen:
        initListOfViolations();
        return MaterialPageRoute(
            builder: (_) => const ListOfViolationsScreen());
      case Routes.searchForDriverScreen:
        initSearchForDriver();
        return MaterialPageRoute(builder: (_) => const SearchForDriverScreen());
      case Routes.searchOnResultsTestsOfLicenseScreen:
        initSearchOnResultsTestsOfLicense();
        return MaterialPageRoute(builder: (_) => const SearchOnResultsTestsOfLicenseScreen());
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
