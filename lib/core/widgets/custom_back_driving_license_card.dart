import '/config/all_imports.dart';

class CustomBackDrivingLicenseCard extends StatelessWidget {
  const CustomBackDrivingLicenseCard({
    this.isShadowWhite = false,
    super.key,
  });

  final bool isShadowWhite;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: ManagerColors.lotion,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h28,
          bottom: ManagerHeight.h7,
        ),
        child: Column(
          children: [
            _divider(),
            verticalSpace(ManagerHeight.h5),
            _DataOfBackDrivingLicenseCard(
              dataAr: ManagerStrings.drivingLicenseGradesAr,
              dataEn: ManagerStrings.drivingLicenseGradesEn,
              textStyleDataAr: context.textTheme
                  .textStyleOfDrivingLicenseGradesArAndBottomTypeOfBackCard(
                      context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: '1. ${ManagerStrings.tractorAr}',
              dataEn: '1. ${ManagerStrings.tractorEn}',
              textStyleDataAr:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
              textStyleDataEn:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: '2. ${ManagerStrings.privateAr}',
              dataEn: '2. ${ManagerStrings.privateEn}',
              textStyleDataAr:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
              textStyleDataEn:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: '3. ${ManagerStrings.commercialAr}',
              dataEn: '3. ${ManagerStrings.commercialEn}',
              textStyleDataAr:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
              textStyleDataEn:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: '4. ${ManagerStrings.commercial15TonAr}',
              dataEn: '4. ${ManagerStrings.commercial15TonEn}',
              textStyleDataAr:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
              textStyleDataEn:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: '5. ${ManagerStrings.trucksOrTrailerAr}',
              dataEn: '5. ${ManagerStrings.trucksOrTrailerEn}',
              textStyleDataAr:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
              textStyleDataEn:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: '6. ${ManagerStrings.taxiAr}',
              dataEn: '6. ${ManagerStrings.taxiEn}',
              textStyleDataAr:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
              textStyleDataEn:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: '7. ${ManagerStrings.busAr}',
              dataEn: '7. ${ManagerStrings.busEn}',
              textStyleDataAr:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
              textStyleDataEn:
                  context.textTheme.textStyleOfTypesOfVehicles(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: 'أ. ${ManagerStrings.motorcycleLessThanOrEqualTo50cmAr}',
              dataEn: ManagerStrings.motorcycleLessThanOrEqualTo50cmEn,
              fontSize: ManagerFontsSizes.f7,
              fontWeight: ManagerFontWeight.medium,
              start: ManagerWidth.w11,
              end: ManagerWidth.w10,
              textStyleDataAr: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
              textStyleDataEn: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: 'ب. ${ManagerStrings.motorcycleLessThanOrEqualTo500cmAr}',
              dataEn: ManagerStrings.motorcycleLessThanOrEqualTo500cmEn,
              fontSize: ManagerFontsSizes.f7,
              fontWeight: ManagerFontWeight.medium,
              start: ManagerWidth.w11,
              end: ManagerWidth.w10,
              textStyleDataAr: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
              textStyleDataEn: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
            ),
            _DataOfBackDrivingLicenseCard(
              dataAr: 'ج. ${ManagerStrings.motorcycleGreaterThan500cmAr}',
              dataEn: ManagerStrings.motorcycleGreaterThan500cmEn,
              fontSize: ManagerFontsSizes.f7,
              fontWeight: ManagerFontWeight.medium,
              start: ManagerWidth.w11,
              end: ManagerWidth.w10,
              textStyleDataAr: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
              textStyleDataEn: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
            ),
            _DataOfBackDrivingLicenseCard(
              isRow: false,
              dataAr: ManagerStrings.skillSet,
              start: ManagerWidth.w11,
              end: ManagerWidth.w30,
              top: ManagerHeight.h5,
              bottom: ManagerHeight.h2,
              textStyleDataAr: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
              textStyleDataEn: context.textTheme
                  .textStyleOfTypesOfMotorcyclesAndDrivers(context),
            ),
            verticalSpace(ManagerHeight.h7),
            _divider(),
            verticalSpace(ManagerHeight.h4),
            _DataOfBackDrivingLicenseCard(
              dataAr:
                  '#${ManagerStrings.automaticVehicleAr}       *${ManagerStrings.glassesAr}',
              dataEn:
                  '#${ManagerStrings.automaticVehicleEn}       *${ManagerStrings.glassesEn}',
              fontWeight: ManagerFontWeight.semiBold,
              fontSize: ManagerFontsSizes.f9,
              start: ManagerWidth.w17,
              end: ManagerWidth.w17,
              textStyleDataAr: context.textTheme
                  .textStyleOfDrivingLicenseGradesArAndBottomTypeOfBackCard(
                      context),
              textStyleDataEn: context.textTheme
                  .textStyleOfDrivingLicenseGradesArAndBottomTypeOfBackCard(
                      context),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataOfBackDrivingLicenseCard extends StatelessWidget {
  const _DataOfBackDrivingLicenseCard({
    required this.dataAr,
    this.textStyleDataAr,
    this.textStyleDataEn,
    this.dataEn,
    this.fontWeight,
    this.fontSize,
    this.start,
    this.end,
    this.top = 0,
    this.bottom = 0,
    this.isRow = true,
  });

  final String dataAr;

  final String? dataEn;
  final FontWeight? fontWeight;

  final double? fontSize;
  final double? start;

  final double? end;
  final double top;

  final double bottom;

  final bool isRow;
  final TextStyle? textStyleDataAr;
  final TextStyle? textStyleDataEn;

  @override
  Widget build(BuildContext context) {
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
                  style: textStyleDataAr,
                ),
                Text(
                  dataEn.onNull(),
                  textDirection: TextDirection.ltr,
                  style: textStyleDataEn,
                ),
              ],
            )
          : Text(
              dataAr,
              textDirection: TextDirection.rtl,
              style: textStyleDataAr,
            ),
    );
  }
}

Widget _divider() {
  return Divider(
    color: ManagerColors.black,
    thickness: ManagerWidth.w05,
  );
}
