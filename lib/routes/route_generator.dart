import '/config/all_imports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

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
            builder: (_) => const DriverViolationsScreen());
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
        final args = settings.arguments as List;
        final isDriver = args[0] as bool;
        final id = args[1] as int;
        return MaterialPageRoute(
            builder: (_) => ChangePasswordScreen(id: id, isDriver: isDriver));
      case Routes.driverProfileScreen:
        initDriverProfile();
        return MaterialPageRoute(builder: (_) => const DriverProfileScreen());
      case Routes.paymentScreen:
        initPayment();
        final args = settings.arguments as List;
        final priceOfViolation = args[0] as String;
        final violationId = args[1] as int;
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(
                  priceOfViolation: priceOfViolation,
                  violationId: violationId,
                ));
      case Routes.verificationCodeScreen:
        initVerificationCode();
        final args = settings.arguments as List;
        final phoneNumber = args[0] as String;
        final id = args[1] as int;
        final isDriver = args[2] as bool;
        final verificationCode = args[3] as int;
        return MaterialPageRoute(
          builder: (_) => VerificationCodeScreen(
            phoneNumber: phoneNumber,
            id: id,
            isDriver: isDriver,
            verificationCode: verificationCode,
          ),
        );
      case Routes.notificationScreen:
        initNotification();
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
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
