import '/config/all_imports.dart';

ThemeData managerLightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    brightness: Brightness.light,

    /// Control text style of application
    textTheme: ManagerTextThemeLight(),

    /// Primary Color in application
    primaryColor: ManagerColors.primaryColor,

    /// Disabled Color
    disabledColor: ManagerColors.disabledColor,

    /// Unselected widget color (unused widget)
    unselectedWidgetColor: ManagerColors.transparent,

    /// [Divider], [PopupMenuDivider], [BorderSide],[between rows in table]
    dividerColor: ManagerColors.dividerColor,

    /// Scaffold background Color in application
    scaffoldBackgroundColor: ManagerColors.white,

    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: ManagerColors.americanGold,
      onPrimary: ManagerColors.philippineGray,
      secondary: ManagerColors.blanchedAlmond,
      onSecondary: ManagerColors.harvestGold,

      // used in [chartBar] in policeManHome
      inversePrimary: ManagerColors.unnecessaryDistribution,

      /// Used as color of [failed status].
      error: ManagerColors.error,

      /// Used as color of [success status].
      onError: ManagerColors.successColor,

      ///Used as color to [exclamation mark] in [CustomBoxOfNumberOfViolationDriver] widget
      scrim: ManagerColors.bittersweetShimmer,
      /////////////////////////////////////////////////
      /////////////////////////////////////////////////
      /// Used In color background of [TextFiled] in Search
      onPrimaryContainer: ManagerColors.lotion,

      /// Used In border color of [TextFiled] in Search
      /// Used In background color page of [create violation]
      /// Used In background color card of [list violation]
      /// Used In background color button of [filter violation]
      outline: ManagerColors.lotion,

      /// Used with any white background
      surface: ManagerColors.white,

      /// Used with any white background
      inverseSurface: ManagerColors.black,

      /// Background color of [cancel button] in [LogoutScreen]
      primaryContainer: ManagerColors.antiFlashWhite,

      /// Shadow color of [BoxShadow] of container
      shadow: ManagerColors.black5,

      /// Background color of [paid] container in [CustomBoxOfNumberOfViolationDriver]
      surfaceContainer: ManagerColors.grannySmithApple,

      /// Background color of [unpaid] container in [CustomBoxOfNumberOfViolationDriver]
      onSecondaryContainer: ManagerColors.begonia,

      /// Background color of [tabBar] in [LoginScreen]
      secondaryContainer: ManagerColors.ghostWhite,

      /// Used in complete step of payment
      onTertiary: ManagerColors.lightSilver40,
    ),

    expansionTileTheme: ExpansionTileThemeData(
      textColor: ManagerColors.white,
      collapsedTextColor: ManagerColors.primaryColor,
      backgroundColor: ManagerColors.primaryColor,
      collapsedBackgroundColor: ManagerColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        side: BorderSide(
          width: ManagerWidth.w05,
          color: ManagerColors.primaryColor,
        ),
      ),
    ),

    /// Theme of icons as [arrow_forward], [arrow_back], [close_button]
    iconTheme: IconThemeData(
      color: ManagerColors.white,
      size: ManagerIconsSizes.i20,
    ),

    /// TabBar theme template
    tabBarTheme: TabBarTheme(
      indicatorColor: ManagerColors.primaryColor,
      dividerColor: ManagerColors.transparent,
      labelStyle: getMediumTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.white,
      ),
      unselectedLabelStyle: getMediumTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.black,
      ),
      labelPadding: EdgeInsetsDirectional.only(
        top: ManagerHeight.h7,
        bottom: ManagerHeight.h7,
      ),
      indicator: BoxDecoration(
        color: ManagerColors.primaryColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
    ),

    /// Check box theme data
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(ManagerColors.white),
      splashRadius: AppConstants.splashRadiusOfCheckboxInLoginScreen,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: const BorderSide(
        color: ManagerColors.philippineGray,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
    ),

    /// Theme any [progressIndicator] in application
    /// [RefreshIndicator], [CircularProgressIndicator], [Linear Progress Indicator]
    progressIndicatorTheme: ProgressIndicatorThemeData(
      refreshBackgroundColor: ManagerColors.blanchedAlmond,
      color: ManagerColors.primaryColor,
    ),
    dialogTheme: DialogTheme(
      barrierColor: ManagerColors.black50,
      backgroundColor: ManagerColors.white,
      shadowColor: ManagerColors.black5,
      iconColor: ManagerColors.white,
      titleTextStyle: getSemiBoldTextStyle(
        color: ManagerColors.eerieBlack,
        fontSize: ManagerFontsSizes.f20,
        decoration: TextDecoration.none,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: ManagerColors.black,
      thickness: AppConstants.thicknessOfDividerThemeData,
      space: AppConstants.heightOfDividerThemeData,
    ),

    /// SnackBar Theme Data use in (Helper mixin)
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ManagerColors.error,
      actionBackgroundColor: ManagerColors.successColor,
      actionTextColor: ManagerColors.white,
      contentTextStyle: getMediumTextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontsSizes.f14,
      ),
    ),

    listTileTheme: ListTileThemeData(
      style: ListTileStyle.drawer,
      iconColor: ManagerColors.black,
      minTileHeight: ManagerHeight.h20,
      titleTextStyle: getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f15,
      ),
      contentPadding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w33,
      ),
    ),

    /// Template drawer to control theme in application
    drawerTheme: DrawerThemeData(
      backgroundColor: ManagerColors.white,
      width: ManagerWidth.w290,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
    ),

    /// Template appBar to control theme in application
    appBarTheme: AppBarTheme(
      centerTitle: true,
      surfaceTintColor: ManagerColors.white,
      backgroundColor: ManagerColors.white,
      titleTextStyle: getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f17,
      ),
      iconTheme: IconThemeData(
        color: ManagerColors.primaryColor,
        size: ManagerIconsSizes.i20,
      ),
    ),

    /// Theme of [CustomTable] widget
    dataTableTheme: DataTableThemeData(
      columnSpacing: ManagerWidth.w5,
      //TODO: this line used form tableOfViolation (edit later)
      // columnSpacing: rows.isNotEmpty ? ManagerWidth.w14 : null,
      headingRowHeight: ManagerHeight.h40,
      dataRowMinHeight: ManagerHeight.h40,
      horizontalMargin: ManagerWidth.w10,
      decoration: BoxDecoration(
        border: Border.all(
          color: ManagerColors.dividerColor,
          width: ManagerWidth.w1,
        ),
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
      headingRowAlignment: MainAxisAlignment.center,
      headingTextStyle: getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f12,
        color: ManagerColors.black70,
      ),
      dataTextStyle: getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f12,
        color: ManagerColors.black50,
      ),
    ),

    /// Theme of [CustomTextField]
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: ManagerColors.lightSilver,
      labelStyle: getMediumTextStyle(
        fontSize: ManagerFontsSizes.f12,
        color: ManagerColors.labelTextFieldColor,
      ),
      hintStyle: getMediumTextStyle(
        fontSize: ManagerFontsSizes.f12,
        color: ManagerColors.labelTextFieldColor,
      ),
      filled: true,
      fillColor: ManagerColors.transparent,
      constraints: BoxConstraints(
        minHeight: ManagerHeight.h48,
        // maxHeight: ManagerHeight.h48,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      errorStyle: getRegularTextStyle(
        fontSize: ManagerFontsSizes.f9,
        color: ManagerColors.error,
      ),
      errorMaxLines: 1,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: BorderSide(
          color: ManagerColors.error,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
    ),
  );
}
