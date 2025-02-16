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
  mainButtonTextStyle(BuildContext context) =>
      getBoldTextStyle(
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
        fontSize: ManagerFontsSizes.f13,
        color: ManagerColors.davyGrey,
        height: 2.5,
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
  TextStyle titleLogoutScreen(BuildContext context) =>
      getSemiBoldTextStyle(
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
  TextStyle cancelLogoutButton(BuildContext context) =>
      getSemiBoldTextStyle(
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
  TextStyle submitComplaintButton(BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f12,
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
  /// TextStyle of [closeButton] in CustomViewViolationDetails widget
  /// complaints >> presentation >> view >> widgets >> [dialogOfCreateComplaint]
  /// payment >> presentation >> view >> widgets >> [CustomViewViolationDetails]
  TextStyle cancelCreateComplaintButtonAndCloseButton(BuildContext context) =>
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
  TextStyle textStyleOfWelcomeWord(BuildContext context) =>
      getBoldTextStyle(
        fontSize: ManagerFontsSizes.f15,
        color: ManagerColors.black,
      );

  /// home >> presentation >> view >> widgets >> [customHomeAppBar]
  TextStyle textStyleOfNameOfUser(BuildContext context) =>
      getBoldTextStyle(
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

  /// core >> widgets >> custom_front_driving_license_card.dart >> [_LicenseData]
  TextStyle textStyleOfDataFrontLicense(BuildContext context) =>
      getMediumTextStyle(
        fontSize: ManagerFontsSizes.f9,
        color: ManagerColors.black,
      );

  /// core >> widgets >> custom_front_driving_license_card.dart >> [_StateOfPalestineLogo]
  TextStyle textStyleOfStateOfPalestineMinistryOfTransportAnCommunicationsEn(
      BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f7,
      );

  /// core >> widgets >> custom_front_driving_license_card.dart >> [_StateOfPalestineLogo]
  TextStyle textStyleOfStateOfPalestineMinistryOfTransportAnCommunicationsAr(
      BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f10,
      );

  /// core >> widgets >> custom_front_driving_license_card.dart >> [_titleOfDrivingLicense]
  TextStyle textStyleOfTitleDrivingLicenseAr(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f11,
      );

  /// core >> widgets >> custom_front_driving_license_card.dart >> [_titleOfDrivingLicense]
  TextStyle textStyleOfTitleDrivingLicenseEn(BuildContext context) =>
      getMediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f9,
      );

  /// core >> widgets >> custom_back_driving_license_card.dart >> [CustomBackDrivingLicenseCard]
  TextStyle textStyleOfTypesOfVehicles(BuildContext context) =>
      getMediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f9,
      );

  /// core >> widgets >> custom_back_driving_license_card.dart >> [CustomBackDrivingLicenseCard]
  TextStyle textStyleOfTypesOfMotorcyclesAndDrivers(BuildContext context) =>
      getRegularTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f7,
      );

  /// core >> widgets >> custom_back_driving_license_card.dart >> [CustomBackDrivingLicenseCard]
  TextStyle textStyleOfDrivingLicenseGradesArAndBottomTypeOfBackCard(
      BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f9,
      );

  /// features >> search >> presentation >> widgets >> [CustomEmptyResultSearch]
  TextStyle textStyleOfEmptyResultSearch(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.spanishGray,
        fontSize: ManagerFontsSizes.f13,
      );

  /// features >> search >> presentation >> widgets >> [CustomCardOfResultTest]
  TextStyle textStyleOfTitleAndSubTitleOfResultTest(BuildContext context,
      bool isSuccessful, bool isTitle) =>
      getBoldTextStyle(
        color: isSuccessful
            ? ManagerColors.successColor
            : ManagerColors.bittersweetShimmer,
        fontSize: isTitle ? ManagerFontsSizes.f13 : ManagerFontsSizes.f18,
      );

  /// features >> payment >> presentation >> screens >> [yourViolations]
  TextStyle textStyleOfTitleDriverViolationsScreen() =>
      getBoldTextStyle(
        color: ManagerColors.primaryColor,
        fontSize: ManagerFontsSizes.f13,
      );

  /// features >> payment >> presentation >> screens >> [youCanViewAllYourPaidAndUnpaidViolations]
  /// features >> payment >> presentation >> screens >> [titleOfCheckBox]
  TextStyle textStyleOfSubTitleDriverViolationsScreen() =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f12,
      );

  /// features >> payment >> presentation >> screens >> [DropdownButton]
  TextStyle textStyleOfTitleTypeOfFilter() =>
      getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f13,
      );

  /// features >> payment >> presentation >> screens >> [DropdownButton]&&[UnFilterButton]
  TextStyle textStyleOfFilterAndUnFilterButtons(bool filter) =>
      getBoldTextStyle(
        color: filter ? ManagerColors.white : ManagerColors.black,
        fontSize: ManagerFontsSizes.f12,
      );

  /// features >> payment >> presentation >> widget >> [CustomViewViolationDetails]
  TextStyle textStyleOfDateOfViolation() =>
      getMediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f9,
        decoration: TextDecoration.none,
      );

  /// features >> payment >> presentation >> widget >> [CustomViewViolationDetails]
  TextStyle textStyleOfNumberOfViolation() =>
      getMediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f11,
        decoration: TextDecoration.none,
      );

  /// features >> payment >> presentation >> widget >> [CustomViewViolationDetails]
  TextStyle textStyleOfTitleOfViolation() =>
      getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f15,
        decoration: TextDecoration.none,
      );

  /// payment >> presentation >> widget >> [CustomViewViolationDetails]
  TextStyle textStyleOfPayNowButton(BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontsSizes.f15,
        decoration: TextDecoration.none,
      );

  /// payment >> presentation >> widget >> [CustomViewViolationDetails]
  TextStyle textStyleOfDetailsOfViolation(BuildContext context) =>
      getMediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f12,
        decoration: TextDecoration.none,
      );

  /// payment >> presentation >> screens >> [PaymentScreen]
  TextStyle textStyleOfNumberOfStepOfPayment(BuildContext context,
      bool isComplete) =>
      getBoldTextStyle(
        color: isComplete ? ManagerColors.white : ManagerColors.black,
        fontSize: ManagerFontsSizes.f16,
      );

  /// payment >> presentation >> screens >> [PaymentScreen]
  TextStyle textStyleOfNameOfStepOfPayment(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f12,
      );

  /// payment >> presentation >> widgets >> [_dataRowOfViolationTable]
  TextStyle textStyleOfStatusOfViolation(BuildContext context, bool isPaid) =>
      getSemiBoldTextStyle(
        color: isPaid
            ? ManagerColors.successColor
            : ManagerColors.bittersweetShimmer,
        fontSize: ManagerFontsSizes.f9,
      );

  /// payment >> presentation >> widgets >> [_dataRowOfViolationTable]
  TextStyle textStyleOfDataRowInTableViolation(BuildContext context,) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black50,
        fontSize: ManagerFontsSizes.f12,
      );

  /// payment >> presentation >> widgets >> [CustomEnterDetailsStep]
  /// payment >> presentation >> widgets >> [CustomPaymentSelectionStep]
  /// payment >> presentation >> widgets >> [CustomPaymentConfirmationStep]
  TextStyle textStyleOfTitleOfStepOfPayment(BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f15,
      );

  /// payment >> presentation >> widgets >> [CustomEnterDetailsStep]
  /// payment >> presentation >> widgets >> [CustomPaymentSelectionStep]
  /// payment >> presentation >> widgets >> [CustomPaymentConfirmationStep]
  TextStyle textStyleOfSubTitleOfStepOfPayment(BuildContext context) =>
      getMediumTextStyle(
        color: ManagerColors.davyGrey,
        fontSize: ManagerFontsSizes.f12,
        height: 2,
      );

  /// payment >> presentation >> widgets >> [CustomEnterDetailsStep]
  /// payment >> presentation >> widgets >> [CustomPaymentSelectionStep]
  /// payment >> presentation >> widgets >> [CustomPaymentConfirmationStep]
  /// payment >> presentation >> widgets >> [CustomStatusPayment]
  TextStyle textStyleOfButtonOfStepOfPayment(BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontsSizes.f15,
      );

  /// payment >> presentation >> widgets >> [CustomPaymentConfirmationStep]
  TextStyle textStyleOfCancelPayButtonOfStepOfPayment(BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f15,
      );

  /// payment >> presentation >> widgets >> [CustomPaymentConfirmationStep]
  TextStyle textStyleOfDetailsOfConfirmationPayment(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f15,
      );

  /// payment >> presentation >> widgets >> [CustomPaymentConfirmationStep]
  TextStyle textStyleOfWarningInConfirmationPayment(BuildContext context) =>
      getMediumTextStyle(
        color: ManagerColors.bittersweetShimmer,
        fontSize: ManagerFontsSizes.f14,
        height: 2,
      );

  /// payment >> presentation >> widgets >> [CustomPaymentMethod]
  TextStyle textStyleOfNameOfPaymentMethod(BuildContext context) =>
      getMediumTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f14,
      );

  /// payment >> presentation >> widgets >> [CustomStatusPayment]
  TextStyle textStyleOfTitleOfStatusOfPayment(BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f20,
        decoration: TextDecoration.none,
      );

  /// payment >> presentation >> widgets >> [CustomStatusPayment]
  TextStyle textStyleOfSubTitleOfStatusOfPayment(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f18,
        decoration: TextDecoration.none,
      );

  /// core >> presentation >> widgets >> [CustomDrawer]
  TextStyle textStyleOfNameInDrawer(BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontsSizes.f14,
      );

  /// core >> presentation >> widgets >> [CustomHeadOfOfficialPaper]
  TextStyle textStyleOfTextOfHeadOfOfficialPaper(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f8,
        height: ManagerHeight.h2,
        decoration: TextDecoration.none,
        // decorationColor: ManagerColors.transparent,
      );

  /// core >> presentation >> widgets >> [customConfirmInformationDialog]
  TextStyle textStyleOfTitleOfCustomConfirmInformationDialog(
      BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.eerieBlack,
        fontSize: ManagerFontsSizes.f20,
        decoration: TextDecoration.none,
      );

  /// core >> presentation >> widgets >> [customConfirmInformationDialog]
  TextStyle textStyleOfBackButtonOfCustomConfirmInformationDialog(
      BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.darkGunmetal,
        fontSize: ManagerFontsSizes.f14,
      );

  /// core >> presentation >> widgets >> [customConfirmInformationDialog]
  TextStyle textStyleOfConfirmButtonOfCustomConfirmInformationDialog(
      BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.white,
        fontSize: ManagerFontsSizes.f14,
      );

  /// violation >> presentation >> view >> screens >> [ListOfViolationsScreen]
  TextStyle textStyleOfNoViolationHasBeenRegistered(BuildContext context) =>
      getRegularTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f14,
      );

  /// violation >> presentation >> view >> screens >> [ListOfViolationsScreen]
  TextStyle textStyleOfFilterViolationDropButton(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black70,
        fontSize: ManagerFontsSizes.f10,
      );

  /// violation >> presentation >> view >> widgets >> [CustomItemCardOfListOfViolation]
  TextStyle textStyleOfDateOfListOfViolation(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f12,
      );

  /// home >> presentation >> view >> widgets >> [CustomBarChartDistribution]
  TextStyle textStyleOfLabelOfXAxisInCustomBarChartDistribution(
      BuildContext context) =>
      getBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f9,
      );

  /// home >> presentation >> view >> widgets >> [CustomBarChartDistribution]
  TextStyle textStyleOfLabelOfYAxisInCustomBarChartDistribution(
      BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f11,
      );
  /// home >> presentation >> view >> widgets >> [CustomBarChartDistribution]
  TextStyle textStyleOfNoteInPoliceHomeScreen(BuildContext context) =>
      getSemiBoldTextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f13,
      );
}
