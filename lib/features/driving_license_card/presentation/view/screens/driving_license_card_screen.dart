import '/config/all_imports.dart';

class DrivingLicenseCardScreen extends StatelessWidget {
  const DrivingLicenseCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ManagerColors.white,
        centerTitle: true,
        surfaceTintColor: ManagerColors.transparent,
        title: Text(
          ManagerStrings.electronicLicense,
          style: TextStyle(
            color: ManagerColors.black,
            fontFamily: ManagerFontFamily.cairo,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f17,
          ),
        ),
        actions: [
          mainButton(
            onPressed: () {},
            minWidth: ManagerWidth.w30,
            height: ManagerHeight.h30,
            color: ManagerColors.transparent,
            highlightColor: ManagerColors.transparent,
            splashColor: ManagerColors.transparent,
            side: BorderSide.none,
            child: const Icon(
              Icons.menu,
              color: ManagerColors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: GetBuilder<DrivingLicenseCardController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
            ),
            child: Column(
              children: [
                Visibility(
                  visible: controller.appearImageDrivingLicenseCard(),
                  child: SizedBox(height: ManagerHeight.h10),
                ),
                Visibility(
                  visible: controller.appearImageDrivingLicenseCard(),
                  child: Image.asset(
                    ManagerAssets.imageDrivingLicenseCard,
                    height: ManagerHeight.h185,
                    width: ManagerWidth.w187,
                    fit: BoxFit.cover,
                  ),
                ),
                Visibility(
                  visible: controller.appearImageDrivingLicenseCard(),
                  child: SizedBox(height: ManagerHeight.h24),
                ),
                Visibility(
                  visible: controller.appearText(),
                  child: Text(
                    ManagerStrings.showYourDrivingLicenseCard,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontsSizes.f15,
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.appearText(),
                  child: SizedBox(height: ManagerHeight.h8),
                ),
                Visibility(
                  visible: controller.appearText(),
                  child: Text(
                    ManagerStrings.titleDrivingLicenseCard,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ManagerColors.davyGrey,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.medium,
                      fontSize: ManagerFontsSizes.f15,
                      height: AppConstants
                          .heightOfTextOfTitleDrivingLicenseCardInDrivingLicenseCardScreen,
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.appearText(),
                  child: SizedBox(height: ManagerHeight.h24),
                ),
                Expanded(
                  child: ListView(
                    primary: false,
                    children: [
                      expansionTileCard(
                        title: ManagerStrings.frontElectronicLicenseCard,
                        isOpen: controller.openFrontElectronicLicenseCard,
                        onExpansionChanged: (value) {
                          controller
                              .changeOpenFrontElectronicLicenseCard(value);
                        },
                        children: [
                          frontDrivingLicenseCard(
                            licenseNumber: controller.licenseNumber,
                            nameAr: controller.nameAr,
                            nameEn: controller.nameEn,
                            idNumber: controller.idNumber,
                            releaseDate: controller.releaseDate,
                            expiryDate: controller.expiryDate,
                            licenseLevels: controller.licenseLevels,
                            imageDriver: controller.imageDriver,
                          )
                        ],
                      ),
                      SizedBox(height: ManagerHeight.h10),
                      expansionTileCard(
                        title: ManagerStrings.backElectronicLicenseCard,
                        isOpen: controller.openBackElectronicLicenseCard,
                        onExpansionChanged: (value) {
                          controller.changeOpenBackElectronicLicenseCard(value);
                        },
                        children: [
                          backDrivingLicenseCard(),
                        ],
                      ),
                      SizedBox(height: ManagerHeight.h10),
                      expansionTileCard(
                        title: ManagerStrings.fullElectronicLicenseCard,
                        isOpen: controller.openFullElectronicLicenseCard,
                        onExpansionChanged: (value) {
                          controller.changeOpenFullElectronicLicenseCard(value);
                        },
                        children: [
                          frontDrivingLicenseCard(
                            licenseNumber: controller.licenseNumber,
                            nameAr: controller.nameAr,
                            nameEn: controller.nameEn,
                            idNumber: controller.idNumber,
                            releaseDate: controller.releaseDate,
                            expiryDate: controller.expiryDate,
                            licenseLevels: controller.licenseLevels,
                            imageDriver: controller.imageDriver,
                            isShadowWhite: true,
                          ),
                          Container(
                            height: ManagerHeight.h6,
                            decoration: BoxDecoration(
                              color: ManagerColors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset:
                                      Offset(ManagerWidth.w0, ManagerHeight.h4),
                                  color: ManagerColors.white,
                                ),
                              ],
                            ),
                          ),
                          backDrivingLicenseCard(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
