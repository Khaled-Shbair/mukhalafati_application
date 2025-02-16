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
          endDrawer: CustomDriverDrawer(isDriverHomeScreen: true),
          appBar: customHomeAppBar(
            context: context,
            welcome: controller.welcome,
            openEndDrawer: () => controller.openEndDrawer(),
            firstName: controller.driverFirstName,
            widget: GestureDetector(
              onTap: () => controller.notificationButton(context),
              child: Badge(
                label: Text(
                  controller.counterOfNotification.toString(),
                  style: context.textTheme.counterOfBadgeNotification(context),
                ),
                backgroundColor: context.theme.colorScheme.error,
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
                children: [
                  Expanded(
                    child: CustomBoxOfNumberOfViolationDriver(
                      isPaid: false,
                      counter: controller.unPaidViolation,
                    ),
                  ),
                  horizontalSpace(ManagerWidth.w19),
                  Expanded(
                    child: CustomBoxOfNumberOfViolationDriver(
                      isPaid: true,
                      counter: controller.paidViolation,
                    ),
                  ),
                ],
              ),
              Text(
                ManagerStrings.instructionsAndGuidelines,
                style: context.textTheme
                    .textStyleOfInstructionsAndGuidelines(context),
              ),
              verticalSpace(ManagerHeight.h4),
              SvgPicture.asset(
                ManagerAssets.instructionsAndGuidelines,
                height: ManagerHeight.h252,
                fit: BoxFit.fill,
              ),
              verticalSpace(ManagerHeight.h15),
              //TODO: Add map later
            ],
          ),
        );
      },
    );
  }
}
