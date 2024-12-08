import '/config/all_imports.dart';

ThemeData managerLightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    ///Primary Color in application
    primaryColor: ManagerColors.primaryColor,

    ///Scaffold background Color in application
    scaffoldBackgroundColor: ManagerColors.white,

    /// Template appBar to application
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
    textTheme: ManagerTextThemeLight(),
  );
}
