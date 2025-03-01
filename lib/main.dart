import '/config/all_imports.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await initModule();

  runApp(
    // MyApp(),
     DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
  );
  // FlutterNativeSplash.remove();
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
