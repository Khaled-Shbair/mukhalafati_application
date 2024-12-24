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
          themeMode: ThemeService.themeMode,
          theme: ThemeService.themeData,
          darkTheme: ThemeService.darkTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: RouteMiddleware.initialRoute(),
          translations: Translation(),
          locale: const Locale(LocaleConstants.arabicLanguage),
          fallbackLocale: const Locale(LocaleConstants.arabicLanguage),
        );
      },
    );
  }
}
