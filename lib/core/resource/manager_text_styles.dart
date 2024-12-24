import '/config/all_imports.dart';

TextStyle _textStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
  double? height,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontFamily: ManagerFontFamily.cairo,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
    height: height,
    decoration: decoration,
  );
}

TextStyle getExtraBoldTextStyle({
  required double fontSize,
  required Color color,
  double? height,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.extraBold,
    fontSize: fontSize,
    color: color,
    height: height,
    decoration: decoration,
  );
}

TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  double? height,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.bold,
    fontSize: fontSize,
    color: color,
    height: height,
    decoration: decoration,
  );
}

TextStyle getSemiBoldTextStyle({
  required double fontSize,
  required Color color,
  double? height,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.semiBold,
    fontSize: fontSize,
    color: color,
    height: height,
    decoration: decoration,
  );
}

TextStyle getMediumTextStyle({
  required double fontSize,
  required Color color,
  double? height,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.medium,
    fontSize: fontSize,
    color: color,
    height: height,
    decoration: decoration,
  );
}

TextStyle getRegularTextStyle({
  required double fontSize,
  required Color color,
  double? height,
  TextDecoration? decoration,
}) {
  return _textStyle(
    fontWeight: ManagerFontWeight.regular,
    fontSize: fontSize,
    color: color,
    height: height,
    decoration: decoration,
  );
}

class ManagerTextStyles {
  /// Used in [CustomCheckBox], [CustomRichText]

// static TextStyle font13PhilippineGrayMedium = _textStyle(
//   fontSize: ManagerFontsSizes.f13,
//   fontWeight: ManagerFontWeight.medium,
//   color: ManagerColors.philippineGray,
// );

  /// Used in [incorrectEnteredCode] in verification code screen
  static TextStyle font12bittersweetShimmerMedium = _textStyle(
    fontSize: ManagerFontsSizes.f12,
    fontWeight: ManagerFontWeight.medium,
    color: ManagerColors.bittersweetShimmer,
  );

  ///Used in [labelStyle] and [hintStyle] of main text field
  static TextStyle font12LabelTextFieldColorMedium = _textStyle(
    color: ManagerColors.labelTextFieldColor,
    fontWeight: ManagerFontWeight.medium,
    fontSize: ManagerFontsSizes.f12,
  );

  ///Used in [input text] in main text field
  static TextStyle font12BlackRegular = _textStyle(
    color: ManagerColors.black,
    fontWeight: ManagerFontWeight.regular,
    fontSize: ManagerFontsSizes.f12,
  );

  ///Used in [dialog] title
  static TextStyle font20EerieBlackSemiBold = _textStyle(
    color: ManagerColors.eerieBlack,
    fontWeight: ManagerFontWeight.semiBold,
    fontSize: ManagerFontsSizes.f20,
    decoration: TextDecoration.none,
  );

  /// Used in [submitComplaint] button in [ListOfComplaintsScreen]
  static TextStyle font11WhiteBold = _textStyle(
    color: ManagerColors.white,
    fontWeight: ManagerFontWeight.bold,
    fontSize: ManagerFontsSizes.f11,
  );

  ///Used in [customFieldOfRow] widget
  static TextStyle font12black50SemiBold = _textStyle(
    color: ManagerColors.black50,
    fontSize: ManagerFontsSizes.f12,
    fontWeight: ManagerFontWeight.semiBold,
  );
}
