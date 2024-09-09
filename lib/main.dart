import 'config/all_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(AppConstants.deviceWidth, AppConstants.deviceHeight),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.ltr,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: RouteGenerator.getRoute,
          translations: Translation(),
          locale: const Locale(LocaleConstants.arabicLanguage),
          fallbackLocale: const Locale(LocaleConstants.arabicLanguage),
        );
      },
    );
  }
}
