import '/config/all_imports.dart';

/// I‘m, write path of where used extension in screen
extension ManagerTextTheme on TextTheme {
  /// Used this way to swap between dark and light
  // TextStyle( color: context.theme.brightness == Brightness.light ?
  //                    Colors.white : Colors.black);

  ///Used in features file:-

  /// onBoarding >> presentation >> view >> widgets >> [PageViewContent]
  /// login >> presentation >> view >> screens >> [WelcomeScreen]
  /// login >> presentation >> view >> screens >> [LoginScreen]
  TextStyle titleOnBoardingAndWelcomeAndLoginScreen(BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f22,
        color: ManagerColors.black,
      );

  /// onBoarding >> presentation >> view >> widgets >> [PageViewContent]
  TextStyle subTitleOnBoardingScreen(BuildContext context) =>
      getRegularTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.davyGrey,
        height: 2,
      );

  /// login >> presentation >> view >> screens >> [WelcomeScreen]
  /// login >> presentation >> view >> screens >> [LoginScreen]
  TextStyle subTitleWelcomeAndLoginScreens(BuildContext context) =>
      getMediumTextStyle(
        fontSize: ManagerFontsSizes.f14,
        color: ManagerColors.blackOlive,
        height: 1.8,
      );

  /// TextStyle of screen that used [MainButton] and child is text.
  /// such as: [login], [forgotPassword], [changePassword] buttons
  mainButtonTextStyle(BuildContext context) => getBoldTextStyle(
        fontSize: ManagerFontsSizes.f16,
        color: ManagerColors.white,
      );

  /// core >> widgets >> [CustomCheckBox].
  /// login >> presentation >> view >> screens >> [CustomTabBarPage]
  TextStyle forgotPasswordButtonAndTextOfCheckBoxInLoginScreen(
          BuildContext context) =>
      getMediumTextStyle(
        fontSize: ManagerFontsSizes.f13,
        color: ManagerColors.black50,
      );

  /// change_password >> presentation >> view >> screens >> [ChangePasswordScreen]
  /// forget_password >> presentation >> view >> screens >> [ForgotPasswordScreen]
  /// forget_password >> presentation >> view >> screens >> [VerificationCodeScreen]
  TextStyle titleForgotAndChangePasswordAndVerificationCodeScreens(
          BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.black,
      );

  /// forget_password >> presentation >> view >> screens >> [ForgotPasswordScreen]
  /// forget_password >> presentation >> view >> screens >> [VerificationCodeScreen]
  /// change_password >> presentation >> view >> screens >> [ChangePasswordScreen]
  TextStyle subTitleForgotAndChangePasswordAndVerificationCodeScreens(
          BuildContext context) =>
      getMediumTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.davyGrey,
        height: 1.8,
      );

  /// forget_password >> presentation >> view >> widgets >> [customIncorrectEnteredCodeMessage]
  TextStyle customIncorrectEnteredCodeMessage(BuildContext context) =>
      getMediumTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.bittersweetShimmer,
      );

  /// forgot password >> presentation >> view >> widgets >> [CustomFiledOfVerificationCode]
  TextStyle textInputInCustomFiledOfVerificationCode(BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f25,
        color: ManagerColors.primaryColor,
      );

  /// logout >> presentation >> view >> screens >> [LogoutScreen]
  TextStyle titleLogoutScreen(BuildContext context) => getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f20,
        color: ManagerColors.black,
      );

  /// TextStyle of [logoutButton] in [LogoutScreen]
  /// TextStyle of [CreateComplaintButton] in [dialogOfCreateComplaint] widget
  /// TextStyle of [NameDriver] in [CustomDriverDrawer] widget
  /// logout >> presentation >> view >> screens >> [LogoutScreen]
  /// complaints >> presentation >> view >> widgets >> [dialogOfCreateComplaint]
  /// home >> presentation >> view >> widgets >> [CustomPageViewItem]
  /// core >> widgets >> [CustomDriverDrawer]
  TextStyle logoutAndCreateComplaintAndNameDriverButton(BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f14,
        color: ManagerColors.white,
      );

  /// TextStyle of [cancelButton] in logout screen
  /// complaints >> presentation >> view >> screens >> [LogoutScreen]
  TextStyle cancelLogoutButton(BuildContext context) => getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f14,
        color: ManagerColors.darkGunmetal,
      );

  /// driving_license_card >> presentation >> view >> screens >> [DrivingLicenseCardScreen]
  TextStyle titleDrivingLicenseCardScreen(BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.black,
      );

  /// driving_license_card >> presentation >> view >> screens >> [DrivingLicenseCardScreen]
  TextStyle subTitleDrivingLicenseCardScreen(BuildContext context) =>
      getMediumTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.davyGrey,
        height: 2,
      );

  /// TextStyle of [submitComplaint] button in [List of complaints screen]
  /// complaints >> presentation >> view >> screens >> [ListOfComplaintsScreen]
  TextStyle submitComplaintButton(BuildContext context) => getBoldTextStyle(
        fontSize: ManagerFontsSizes.f11,
        color: ManagerColors.white,
      );

  /// core >> widgets >> custom_table >> [CustomEmptyTable]
  /// complaints >> presentation >> view >> screens >> [ListOfComplaintsScreen]
  TextStyle titleListOfComplaintsScreenAndStyleOfTextInEmptyTable(
          BuildContext context) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f12,
        color: ManagerColors.black,
      );

  /// TextStyle of [status] of Complaint in [List of Complaints screen]
  /// complaints >> presentation >> view >> screens >> [ListOfComplaintsScreen]
  TextStyle statusOfComplaint(BuildContext context, bool status) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f9,
        color: status ? ManagerColors.successColor : ManagerColors.harvestGold,
      );

  /// TextStyle of [cancelButton] in dialogOfCreateComplaint widget
  /// complaints >> presentation >> view >> widgets >> [dialogOfCreateComplaint]
  TextStyle cancelCreateComplaintButton(BuildContext context) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f14,
        color: ManagerColors.black,
      );

  /// home >> presentation >> view >> screens >> [DriverHomeScreen]
  TextStyle counterOfBadgeNotification(BuildContext context) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f10,
        color: ManagerColors.white,
      );

  /// home >> presentation >> view >> screens >> [DriverHomeScreen]
  TextStyle textStyleOfInstructionsAndGuidelines(BuildContext context) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f16,
        color: ManagerColors.black,
      );

  /// home >> presentation >> view >> widgets >> [customHomeAppBar]
  TextStyle textStyleOfWelcomeWord(BuildContext context) => getBoldTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.black,
      );

  /// home >> presentation >> view >> widgets >> [customHomeAppBar]
  TextStyle textStyleOfNameOfUser(BuildContext context) => getBoldTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.eerieBlack,
      );

  /// home >> presentation >> view >> widgets >> [customHomeAppBar]
  TextStyle textStyleOfIsPaidOrUnPaid(BuildContext context, bool isPaid) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: isPaid
            ? ManagerColors.successColor
            : ManagerColors.bittersweetShimmer,
      );

  /// core >> widgets >> [CustomTextField]
  TextStyle textStyleOfInputTextFiled(BuildContext context) =>
      getRegularTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f12,
      );

  /// profile >> view >> screens >> [DriverProfileScreen]
  TextStyle labelStyleOfDataInDriverProfile(BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.primaryColor,
        fontSize: ManagerFontsSizes.f14,
      );

  /// TextStyle of [textFiled] of data of user in driver profile screen
  /// profile >> presentation >> view >> screens >> [DriverProfileScreen]
  TextStyle textStyleOfUserDataInProfile(BuildContext context) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f12,
        color: ManagerColors.black,
      );

  /// home >> presentation >> view >> widgets >> [CustomStatisticsBoxPoliceMan]
  /// TextStyle of [label] of data of bar chart in custom bar chart distribution widget
  /// home >> presentation >> view >> widgets >> [CustomBarChartDistribution]
  TextStyle titleCustomStatisticsBoxPoliceManAndDataLabelInBarChart(
          BuildContext context) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f11,
        color: ManagerColors.black,
      );

  /// home >> presentation >> view >> widgets >> [CustomStatisticsBoxPoliceMan]
  TextStyle subTitleCustomStatisticsBoxPoliceMan(BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.primaryColor,
      );

  /// TextStyle of title selected [Button] in CustomButtonForViolationDistributionPages widget
  /// home >> presentation >> view >> widgets >> [CustomButtonForViolationDistributionPages]
  TextStyle selectedCustomButtonForViolationDistributionPages(
          BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f13,
        color: ManagerColors.white,
      );

  /// TextStyle of title un-selected [Button] in CustomButtonForViolationDistributionPages widget
  /// home >> presentation >> view >> widgets >> [CustomButtonForViolationDistributionPages]
  TextStyle unSelectedCustomButtonForViolationDistributionPages(
          BuildContext context) =>
      getSemiBoldTextStyle(
        fontSize: ManagerFontsSizes.f13,
        color: ManagerColors.primaryColor,
      );
}
