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
      case Routes.driverHomeScreen:
        initDriverHome();
        return MaterialPageRoute(builder: (_) => const DriverHomeScreen());
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
      case Routes.violationPaymentScreen:
        initViolationPayment();
        return MaterialPageRoute(
            builder: (_) => const ViolationPaymentScreen());
      case Routes.searchForDriverScreen:
        initSearchForDriver();
        return MaterialPageRoute(builder: (_) => const SearchForDriverScreen());
      case Routes.searchOnResultsTestsOfLicenseScreen:
        initSearchOnResultsTestsOfLicense();
        return MaterialPageRoute(
            builder: (_) => const SearchOnResultsTestsOfLicenseScreen());
      case Routes.drivingLicenseCardScreen:
        initDrivingLicenseCard();
        return MaterialPageRoute(
            builder: (_) => const DrivingLicenseCardScreen());
      case Routes.listOfComplaintsScreen:
        initListOfComplaints();
        return MaterialPageRoute(
            builder: (_) => const ListOfComplaintsScreen());
      case Routes.forgetDriverPasswordScreen:
        initForgotPasswordForDriver();
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordForDriverScreen());
      case Routes.forgetPoliceManPasswordScreen:
        initForgotPasswordForPoliceMan();
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordForPoliceManScreen());
      case Routes.changePasswordScreen:
        initChangePassword();
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.driverProfileScreen:
        initDriverProfile();
        return MaterialPageRoute(builder: (_) => const DriverProfileScreen());
      case Routes.paymentScreen:
        initPayment();
        final priceOfViolation = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(priceOfViolation: priceOfViolation));
      case Routes.verificationCodeScreen:
        initVerificationCode();
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => VerificationCodeScreen(phoneNumber: phoneNumber));
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
