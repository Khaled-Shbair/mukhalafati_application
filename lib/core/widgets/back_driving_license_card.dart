import '/config/all_imports.dart';

Widget backDrivingLicenseCard({bool isShadowWhite = false}) {
  return Container(
    padding: EdgeInsetsDirectional.only(
      top: ManagerHeight.h28,
      bottom: ManagerHeight.h6,
    ),
    decoration: BoxDecoration(
      color: ManagerColors.lotion,
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    child: Column(
      children: [
        Divider(
          color: ManagerColors.black,
          thickness: ManagerWidth.w05,
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: ManagerStrings.drivingLicenseGradesAr,
          dataEn: ManagerStrings.drivingLicenseGradesEn,
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: '1. ${ManagerStrings.tractorAr}',
          dataEn: '1. ${ManagerStrings.tractorEn}',
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: '2. ${ManagerStrings.privateAr}',
          dataEn: '2. ${ManagerStrings.privateEn}',
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: '3. ${ManagerStrings.commercialAr}',
          dataEn: '3. ${ManagerStrings.commercialEn}',
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: '4. ${ManagerStrings.commercial15TonAr}',
          dataEn: '4. ${ManagerStrings.commercial15TonEn}',
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: '5. ${ManagerStrings.trucksOrTrailerAr}',
          dataEn: '5. ${ManagerStrings.trucksOrTrailerEn}',
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: '6. ${ManagerStrings.taxiAr}',
          dataEn: '6. ${ManagerStrings.taxiEn}',
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: '7. ${ManagerStrings.busAr}',
          dataEn: '7. ${ManagerStrings.busEn}',
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: 'أ. ${ManagerStrings.motorcycleLessThanOrEqualTo50cmAr}',
          dataEn: ManagerStrings.motorcycleLessThanOrEqualTo50cmEn,
          fontSize: ManagerFontsSizes.f7,
          fontWeight: ManagerFontWeight.medium,
          start: ManagerWidth.w11,
          end: ManagerWidth.w10,
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: 'ب. ${ManagerStrings.motorcycleLessThanOrEqualTo500cmAr}',
          dataEn: ManagerStrings.motorcycleLessThanOrEqualTo500cmEn,
          fontSize: ManagerFontsSizes.f7,
          fontWeight: ManagerFontWeight.medium,
          start: ManagerWidth.w11,
          end: ManagerWidth.w10,
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr: 'ج. ${ManagerStrings.motorcycleGreaterThan500cmAr}',
          dataEn: ManagerStrings.motorcycleGreaterThan500cmEn,
          fontSize: ManagerFontsSizes.f7,
          fontWeight: ManagerFontWeight.medium,
          start: ManagerWidth.w11,
          end: ManagerWidth.w10,
        ),
        _dataOfBackDrivingLicenseCard(
          isRow: false,
          dataAr: ManagerStrings.skillSet,
          start: ManagerWidth.w11,
          end: ManagerWidth.w48,
          top: ManagerHeight.h5,
          bottom: ManagerHeight.h2,
        ),
        Divider(
          color: ManagerColors.black,
          thickness: ManagerWidth.w05,
        ),
        _dataOfBackDrivingLicenseCard(
          dataAr:
              '#${ManagerStrings.automaticVehicleAr}       *${ManagerStrings.glassesAr}',
          dataEn:
              '#${ManagerStrings.automaticVehicleEn}       *${ManagerStrings.glassesEn}',
          fontWeight: ManagerFontWeight.semiBold,
          fontSize: ManagerFontsSizes.f9,
          start: ManagerWidth.w17,
          end: ManagerWidth.w17,
        ),
      ],
    ),
  );
}

Widget _dataOfBackDrivingLicenseCard({
  required String dataAr,
  String? dataEn,
  FontWeight? fontWeight,
  double? fontSize,
  double? start,
  double? end,
  double top = 0,
  double bottom = 0,
  bool isRow = true,
}) {
  return Padding(
    padding: EdgeInsetsDirectional.only(
      start: start ?? ManagerWidth.w9,
      end: end ?? ManagerWidth.w9,
      top: top,
      bottom: bottom,
    ),
    child: isRow
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataAr,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: ManagerColors.black,
                  fontFamily: ManagerFontFamily.cairo,
                  fontWeight: fontWeight ?? ManagerFontWeight.semiBold,
                  fontSize: fontSize ?? ManagerFontsSizes.f9,
                ),
              ),
              Text(
                dataEn.onNull(),
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: ManagerColors.black,
                  fontFamily: ManagerFontFamily.cairo,
                  fontWeight: fontWeight ?? ManagerFontWeight.medium,
                  fontSize: fontSize ?? ManagerFontsSizes.f9,
                ),
              ),
            ],
          )
        : Text(
            dataAr,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: ManagerColors.black,
              fontFamily: ManagerFontFamily.cairo,
              fontWeight: ManagerFontWeight.medium,
              fontSize: ManagerFontsSizes.f7,
            ),
          ),
  );
}
