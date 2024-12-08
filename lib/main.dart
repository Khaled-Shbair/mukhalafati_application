import 'package:mukhalafati_application/core/service/theme_service.dart';

import 'config/all_imports.dart';

void main() async {
  await initModule();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) : themeService = ThemeService();

  final ThemeService themeService;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        AppConstants.deviceWidth,
        AppConstants.deviceHeight,
      ),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          themeMode: themeService.getThemeMode(),
          debugShowCheckedModeBanner: false,
          initialRoute: SharedPreferencesController.getBool(
                  SharedPreferencesKeys.onBoarding)
              ? SharedPreferencesController.getBool(
                      SharedPreferencesKeys.rememberMeDriver)
                  ? Routes.driverHomeScreen
                  : SharedPreferencesController.getBool(
                          SharedPreferencesKeys.rememberMePolice)
                      ? Routes.policeManHomeScreen
                      : Routes.welcomeScreen
              : Routes.onBoardingScreen,
          onGenerateRoute: RouteGenerator.getRoute,
          translations: Translation(),
          locale: const Locale(LocaleConstants.arabicLanguage),
          fallbackLocale: const Locale(LocaleConstants.arabicLanguage),
        );
      },
    );
  }
}
