import '/config/all_imports.dart';

class WelcomeController extends GetxController {

  /// when tap on button navigate to login screen
  void loginButton(BuildContext context) {
    context.pushNamed(Routes.loginScreen);
  }
}
