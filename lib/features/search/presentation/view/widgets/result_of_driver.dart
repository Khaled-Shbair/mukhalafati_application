import '/config/all_imports.dart';

Widget resultOfDriver({
  required String licenseNumber,
  required String nameAr,
  required String nameEn,
  required String idNumber,
  required String releaseDate,
  required String expiryDate,
  required String licenseLevels,
  required String imageDriver,
  required int numberOfViolations,
  required BuildContext context,
}) {
  return Column(
    children: [
      FrontDrivingLicenseCard(
        licenseNumber: licenseNumber,
        expiryDate: expiryDate,
        imageDriver: imageDriver,
        licenseLevels: licenseLevels,
        releaseDate: releaseDate,
        idNumber: idNumber,
        nameAr: nameAr,
        nameEn: nameEn,
      ),
      SizedBox(height: ManagerHeight.h10),
      Container(
        width: ManagerWidth.infinity,
        margin: EdgeInsetsDirectional.only(
          top: ManagerHeight.h10,
        ),
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h20,
          bottom: ManagerHeight.h20,
          start: ManagerWidth.w10,
          end: ManagerWidth.w10,
        ),
        decoration: BoxDecoration(
          color: ManagerColors.lotion,
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
          boxShadow: [
            BoxShadow(
              offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
              color: ManagerColors.black5,
              blurRadius: AppConstants
                  .blurRadiusOfBoxShadowInNumberOfViolationsContainerInResultOfDriverWidget,
            ),
          ],
        ),
        child: CustomRichText(
          textStyle: TextStyle(
            color: ManagerColors.black,
            fontSize: ManagerFontsSizes.f12,
            fontWeight: ManagerFontWeight.bold,
          ),
          title: '${ManagerStrings.numberOfViolations}: ',
          children: [
            customTextSpan(
              context: context,
              text: '$numberOfViolations ${ManagerStrings.violation}',
              textStyle: TextStyle(
                color: ManagerColors.black,
                fontSize: ManagerFontsSizes.f12,
                fontWeight: ManagerFontWeight.regular,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
