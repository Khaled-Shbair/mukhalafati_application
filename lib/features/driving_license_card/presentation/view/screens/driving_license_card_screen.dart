import '/config/all_imports.dart';

class DrivingLicenseCardScreen extends StatelessWidget {
  const DrivingLicenseCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrivingLicenseCardController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          endDrawer: CustomDriverDrawer(isDrivingLicenseCardScreen: true),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.electronicLicense),
            actions: [
              menuButton(() => controller.openEndDrawer()),
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
                      child: verticalSpace(ManagerHeight.h10),
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
                      child: verticalSpace(ManagerHeight.h24),
                    ),
                    Visibility(
                      visible: controller.appearText(),
                      child: Text(ManagerStrings.showYourDrivingLicenseCard,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium),
                    ),
                    Visibility(
                      visible: controller.appearText(),
                      child: verticalSpace(ManagerHeight.h8),
                    ),
                    Visibility(
                      visible: controller.appearText(),
                      child: Text(
                        ManagerStrings.titleDrivingLicenseCard,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    Visibility(
                      visible: controller.appearText(),
                      child: verticalSpace(ManagerHeight.h24),
                    ),
                    Expanded(
                      child: ListView(
                        primary: false,
                        children: [
                          CustomExpansionTileCard(
                            title: ManagerStrings.frontElectronicLicenseCard,
                            isOpen: controller.openFrontElectronicLicenseCard,
                            onExpansionChanged: (value) {
                              controller
                                  .changeOpenFrontElectronicLicenseCard(value);
                            },
                            children: [
                              FrontDrivingLicenseCard(
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
                          verticalSpace(ManagerHeight.h10),
                          CustomExpansionTileCard(
                            title: ManagerStrings.backElectronicLicenseCard,
                            isOpen: controller.openBackElectronicLicenseCard,
                            onExpansionChanged: (value) {
                              controller
                                  .changeOpenBackElectronicLicenseCard(value);
                            },
                            children: [
                              backDrivingLicenseCard(),
                            ],
                          ),
                          verticalSpace(ManagerHeight.h10),
                          CustomExpansionTileCard(
                            title: ManagerStrings.fullElectronicLicenseCard,
                            isOpen: controller.openFullElectronicLicenseCard,
                            onExpansionChanged: (value) {
                              controller
                                  .changeOpenFullElectronicLicenseCard(value);
                            },
                            children: [
                              FrontDrivingLicenseCard(
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
                                  color: context.theme.colorScheme.surface,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(
                                        ManagerWidth.w0,
                                        ManagerHeight.h4,
                                      ),
                                      color: context.theme.colorScheme.surface,
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
      },
    );
  }
}
