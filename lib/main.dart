import 'config/all_imports.dart';

void main() {
  initModule();
  runApp(const MyApp());
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
          initialRoute: Routes.policeManHomeScreen,
          onGenerateRoute: RouteGenerator.getRoute,
          translations: Translation(),
          locale: const Locale(LocaleConstants.arabicLanguage),
          fallbackLocale: const Locale(LocaleConstants.arabicLanguage),
        );
      },
    );
  }
}
