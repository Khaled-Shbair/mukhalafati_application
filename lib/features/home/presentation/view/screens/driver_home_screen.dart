import '/config/all_imports.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverHomeController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          endDrawer: driverDrawer(
            driverName: controller.driverName,
            driverImage: controller.driverImage,
          ),
          appBar: homeAppBar(
            welcome: controller.welcome,
            openEndDrawer: () => controller.openEndDrawer(),
            firstName: controller.driverFirstName,
            widget: GestureDetector(
              onTap: () => controller.notificationButton(),
              child: Badge(
                label: Text(
                  '${controller.counterOfNotification}',
                  style: TextStyle(
                    color: ManagerColors.white,
                    fontFamily: ManagerFontFamily.cairo,
                    fontSize: ManagerFontsSizes.f10,
                    fontWeight: ManagerFontWeight.semiBold,
                  ),
                ),
                backgroundColor: ManagerColors.redNotification,
                child: SvgPicture.asset(
                  ManagerAssets.notificationIcon,
                  height: ManagerHeight.h24,
                  width: ManagerWidth.w24,
                ),
              ),
            ),
          ),
          body: ListView(
            primary: false,
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w16,
              end: ManagerWidth.w16,
              top: ManagerHeight.h10,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxOfNumberOfViolationDriver(
                    isPaid: false,
                    counter: controller.unPaidViolation,
                  ),
                  boxOfNumberOfViolationDriver(
                    isPaid: true,
                    counter: controller.paidViolation,
                  ),
                ],
              ),
              Text(
                ManagerStrings.instructionsAndGuidelines,
                style: TextStyle(
                  fontFamily: ManagerFontFamily.cairo,
                  fontWeight: ManagerFontWeight.semiBold,
                  fontSize: ManagerFontsSizes.f16,
                  color: ManagerColors.black,
                ),
              ),
              SvgPicture.asset(
                ManagerAssets.instructionsAndGuidelines,
                height: ManagerHeight.h252,
                width: ManagerWidth.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: ManagerHeight.h15),
              //TODO: Add map later
            ],
          ),
        );
      },
    );
  }
}
