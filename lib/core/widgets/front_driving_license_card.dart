import '/config/all_imports.dart';

class FrontDrivingLicenseCard extends StatelessWidget {
  const FrontDrivingLicenseCard({
    required this.licenseNumber,
    required this.nameAr,
    required this.nameEn,
    required this.idNumber,
    required this.releaseDate,
    required this.expiryDate,
    required this.licenseLevels,
    required this.imageDriver,
    this.isShadowWhite = false,
    super.key,
  });

  final String licenseNumber;
  final String nameAr;
  final String nameEn;
  final String idNumber;
  final String releaseDate;
  final String expiryDate;
  final String licenseLevels;
  final String imageDriver;
  final bool isShadowWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.zero,
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w6,
        end: ManagerWidth.w6,
        bottom: ManagerHeight.h10,
        top: ManagerHeight.h10,
      ),
      decoration: BoxDecoration(
        color: ManagerColors.lotion,
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        boxShadow: [
          BoxShadow(
            offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
            color: ManagerColors.black5,
            blurRadius:
                AppConstants.blurRadiusOfBoxShadowInResultOfDriverWidget,
          ),
          if (isShadowWhite) ...{
            BoxShadow(
              offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
              color: ManagerColors.white,
            ),
          },
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: ManagerWidth.w5),
                child: Text(
                  ManagerStrings
                      .stateOfPalestineMinistryOfTransportAnCommunicationsAr,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: ManagerColors.black,
                    fontSize: ManagerFontsSizes.f10,
                    fontWeight: ManagerFontWeight.bold,
                    fontFamily: ManagerFontFamily.cairo,
                  ),
                ),
              ),
              Image.asset(
                ManagerAssets.palestineLogo,
                height: ManagerHeight.h48,
                width: ManagerWidth.w38,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Text(
                    ManagerStrings
                        .stateOfPalestineMinistryOfTransportAnCommunicationsEn,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontSize: ManagerFontsSizes.f7,
                      fontWeight: ManagerFontWeight.semiBold,
                      fontFamily: ManagerFontFamily.cairo,
                    ),
                  ),
                  SizedBox(width: ManagerWidth.w4),
                  Image.asset(
                    ManagerAssets.palestineFlag,
                    height: ManagerHeight.h22,
                    width: ManagerWidth.w32,
                  ),
                  SizedBox(width: ManagerWidth.w8),
                ],
              ),
            ],
          ),
          SizedBox(height: ManagerHeight.h10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ManagerStrings.drivingLicense,
                style: TextStyle(
                  color: ManagerColors.black,
                  fontSize: ManagerFontsSizes.f11,
                  fontWeight: ManagerFontWeight.semiBold,
                  fontFamily: ManagerFontFamily.cairo,
                ),
              ),
              SizedBox(width: ManagerWidth.w15),
              Text(
                'DRIVING LICENSE',
                style: TextStyle(
                  color: ManagerColors.black,
                  fontSize: ManagerFontsSizes.f9,
                  fontWeight: ManagerFontWeight.medium,
                  fontFamily: ManagerFontFamily.cairo,
                ),
              ),
            ],
          ),
          SizedBox(height: ManagerHeight.h10),
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Table(
                border: TableBorder(
                  borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  top: borderSideOfTable(),
                  bottom: borderSideOfTable(),
                  horizontalInside: borderSideOfTable(),
                  left: borderSideOfTable(),
                  right: borderSideOfTable(),
                  verticalInside: borderSideOfTable(),
                ),
                children: [
                  rowOfTable(
                    nameRow: ManagerStrings.licenseNumber,
                    dataAr: licenseNumber,
                    context: context,
                  ),
                  rowOfTable(
                    nameRow: ManagerStrings.name,
                    isName: true,
                    dataAr: nameAr,
                    dataEn: nameEn,
                    context: context,
                  ),
                  rowOfTable(
                    nameRow: ManagerStrings.idNumber,
                    dataAr: idNumber,
                    context: context,
                  ),
                  rowOfTable(
                    context: context,
                    nameRow: ManagerStrings.releaseDate,
                    dataAr: releaseDate,
                    isRow: true,
                    nameRowTwo: ManagerStrings.expiryDate,
                    dataRowTwo: expiryDate,
                  ),
                  rowOfTable(
                    nameRow: ManagerStrings.licenseLevels,
                    dataAr: licenseLevels,
                    context: context,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                  end: ManagerWidth.w15,
                  start: ManagerWidth.w15,
                  top: ManagerHeight.h13,
                ),
                height: ManagerHeight.h112,
                width: ManagerWidth.w85,
                color: ManagerColors.white,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ManagerColors.lotion,
                      offset: Offset(ManagerWidth.wM1405, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  image: DecorationImage(
                    image: customCachedNetworkImageProvider(imageDriver),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
