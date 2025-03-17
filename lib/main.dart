import '/config/all_imports.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await initModule();

  runApp(
    MyApp(),
    // DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
  );
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
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      enableScaleWH: () => true,
      enableScaleText: () => true,
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
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
