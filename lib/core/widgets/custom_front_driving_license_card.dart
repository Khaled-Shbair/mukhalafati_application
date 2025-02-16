import '/config/all_imports.dart';

class CustomFrontDrivingLicenseCard extends StatelessWidget {
  const CustomFrontDrivingLicenseCard({
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
        start: ManagerWidth.w7,
        end: ManagerWidth.w7,
        bottom: ManagerHeight.h10,
        top: ManagerHeight.h9,
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
          _StateOfPalestineLogo(),
          verticalSpace(ManagerHeight.h10),
          _TitleOfDrivingLicense(),
          verticalSpace(ManagerHeight.h10),
          _DetailsOfDrivingLicense(
            licenseNumber: licenseNumber,
            nameAr: nameAr,
            nameEn: nameEn,
            idNumber: idNumber,
            imageDriver: imageDriver,
            releaseDate: releaseDate,
            expiryDate: expiryDate,
            licenseLevels: licenseLevels,
          ),
        ],
      ),
    );
  }
}

class _TitleOfDrivingLicense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ManagerStrings.drivingLicense,
          style: context.textTheme.textStyleOfTitleDrivingLicenseAr(context),
        ),
        horizontalSpace(ManagerWidth.w15),
        Text(
          ManagerStrings.drivingLicenseEn,
          style: context.textTheme.textStyleOfTitleDrivingLicenseEn(context),
        ),
      ],
    );
  }
}

class _StateOfPalestineLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: ManagerWidth.w6),
          child: Text(
            ManagerStrings
                .stateOfPalestineMinistryOfTransportAnCommunicationsAr,
            textDirection: TextDirection.rtl,
            style: context.textTheme
                .textStyleOfStateOfPalestineMinistryOfTransportAnCommunicationsAr(
                    context),
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
              style: context.textTheme
                  .textStyleOfStateOfPalestineMinistryOfTransportAnCommunicationsEn(
                      context),
            ),
            horizontalSpace(ManagerWidth.w4),
            Image.asset(
              ManagerAssets.palestineFlag,
              height: ManagerHeight.h22,
              width: ManagerWidth.w32,
            ),
            horizontalSpace(ManagerWidth.w9),
          ],
        ),
      ],
    );
  }
}

class _DetailsOfDrivingLicense extends StatelessWidget {
  const _DetailsOfDrivingLicense({
    required this.licenseNumber,
    required this.nameAr,
    required this.nameEn,
    required this.idNumber,
    required this.imageDriver,
    required this.releaseDate,
    required this.expiryDate,
    required this.licenseLevels,
  });

  final String licenseNumber;
  final String nameAr;
  final String nameEn;
  final String idNumber;
  final String imageDriver;
  final String releaseDate;
  final String expiryDate;
  final String licenseLevels;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        side: BorderSide(
          color: ManagerColors.black,
          width: ManagerWidth.w05,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h9,
          bottom: ManagerHeight.h9,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _LicenseData(
                        title: ManagerStrings.licenseNumber,
                        subTitle: licenseNumber,
                        bottomPadding: ManagerHeight.h9,
                      ),
                      _divider(),
                      _LicenseData(
                        title: ManagerStrings.name,
                        subTitle: nameAr,
                        subTitleNameEn: nameEn,
                        topPadding: ManagerHeight.h7,
                        bottomPadding: ManagerHeight.h4,
                      ),
                      _divider(),
                      _LicenseData(
                        title: ManagerStrings.idNumber,
                        subTitle: idNumber,
                        topPadding: ManagerHeight.h4,
                        bottomPadding: ManagerHeight.h5,
                      ),
                      _divider(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(
                    end: ManagerWidth.w9,
                    top: ManagerHeight.h2,
                  ),
                  height: ManagerHeight.h100,
                  width: ManagerWidth.w80,
                  decoration: BoxDecoration(
                    color: ManagerColors.white,
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                    image: DecorationImage(
                      image: customCachedNetworkImageProvider(imageDriver),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _LicenseData(
                  title: ManagerStrings.releaseDate,
                  subTitle: releaseDate,
                  topPadding: ManagerHeight.h5,
                  bottomPadding: ManagerHeight.h6,
                ),
                Spacer(),
                _LicenseData(
                  title: ManagerStrings.expiryDate,
                  subTitle: expiryDate,
                ),
                Spacer(),
              ],
            ),
            _divider(),
            _LicenseData(
              title: ManagerStrings.licenseLevels,
              subTitle: licenseLevels,
              topPadding: ManagerHeight.h5,
            ),
          ],
        ),
      ),
    );
  }
}

class _LicenseData extends StatelessWidget {
  const _LicenseData({
    required this.title,
    this.subTitleNameEn,
    required this.subTitle,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
  });

  final String title;
  final String subTitle;
  final String? subTitleNameEn;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w9,
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: '$title:  ',
          style: context.textTheme.textStyleOfDataFrontLicense(context),
          children: [
            TextSpan(
              text: subTitle,
              style: context.textTheme.textStyleOfDataFrontLicense(context),
            ),
            if (subTitleNameEn != null) ...{
              TextSpan(
                text: '\n$subTitleNameEn',
                style: context.textTheme.textStyleOfDataFrontLicense(context),
              ),
            }
          ],
        ),
      ),
    );
  }
}

Widget _divider() {
  return Divider(
    color: ManagerColors.black,
    height: ManagerWidth.w05,
  );
}
