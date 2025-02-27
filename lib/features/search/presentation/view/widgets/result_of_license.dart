import '/config/all_imports.dart';

Widget resultOfLicense({
  required String resultName,
  required bool statusLicenseTest,
  required bool statusPracticalTest,
}) {
  return Column(
    children: [
      SizedBox(height: ManagerHeight.h16),
      SvgPicture.asset(
        ManagerAssets.resultOfLicense,
        height: ManagerHeight.h168,
        width: ManagerWidth.w169,
        fit: BoxFit.cover,
      ),
      SizedBox(height: ManagerHeight.h26),
      Row(
        children: [
          Image.asset(
            ManagerAssets.userIcon,
            height: ManagerHeight.h16,
            width: ManagerWidth.w16,
          ),
          SizedBox(width: ManagerWidth.w4),
          Text(
            '${ManagerStrings.name}:  ',
            style: TextStyle(
              fontFamily: ManagerFontFamily.cairo,
              color: ManagerColors.black,
              fontWeight: ManagerFontWeight.bold,
              fontSize: ManagerFontsSizes.f12,
            ),
          ),
          Text(
            resultName,
            style: TextStyle(
              fontFamily: ManagerFontFamily.cairo,
              color: ManagerColors.black,
              fontWeight: ManagerFontWeight.semiBold,
              fontSize: ManagerFontsSizes.f12,
            ),
          ),
        ],
      ),
      SizedBox(height: ManagerHeight.h28),
      CustomCardOfResultTest(
        testType: ManagerStrings.theoreticalTestResult,
        isSuccessful: statusLicenseTest,
      ),
      CustomCardOfResultTest(
        testType: ManagerStrings.practicalTestResult,
        isSuccessful: statusPracticalTest,
      ),
    ],
  );
}
