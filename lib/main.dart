import 'config/all_imports.dart';

void main() async {
  await initModule();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          theme: ThemeData(
            scaffoldBackgroundColor: ManagerColors.white,
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              surfaceTintColor: ManagerColors.white,
              backgroundColor: ManagerColors.white,
              titleTextStyle: TextStyle(
                color: ManagerColors.black,
                fontFamily: ManagerFontFamily.cairo,
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontsSizes.f17,
              ),
              iconTheme: IconThemeData(
                color: ManagerColors.primaryColor,
                size: ManagerIconsSizes.i20,
              ),
            ),
          ),
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
