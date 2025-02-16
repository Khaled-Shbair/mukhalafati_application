import '/config/all_imports.dart';

class ListOfViolationsScreen extends StatelessWidget {
  const ListOfViolationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOfViolationsController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.listOfViolations),
            actions: [
              CustomMenuButton(() => controller.openEndDrawer()),
            ],
          ),
          endDrawer: CustomPoliceManDrawer(isListOfViolationsScreen: true),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeight.h20,
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchDropDown(
                        onChangedFunction: controller.changeDate,
                        selectedItem: controller.selectDate,
                        items: controller.allDate,
                        hintText: ManagerStrings.dateFilter,
                        labelStyle: context.textTheme
                            .textStyleOfFilterViolationDropButton(context),
                      ),
                    ),
                    horizontalSpace(ManagerWidth.w12),
                    Expanded(
                      child: CustomSearchDropDown(
                        onChangedFunction: controller.changeRegion,
                        selectedItem: controller.selectRegion,
                        items: controller.allRegion,
                        hintText: ManagerStrings.regionFilter,
                        labelStyle: context.textTheme
                            .textStyleOfFilterViolationDropButton(context),
                      ),
                    ),
                  ],
                ),
                verticalSpace(ManagerHeight.h20),
                if (controller.loading == true) ...{
                  Center(child: CustomLoading()),
                } else if (controller.displayedViolations.isNotEmpty &&
                    controller.loading == false) ...{
                  Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(
                          controller.displayedViolations.length,
                          (index) {
                            ViolationModel violation =
                                controller.displayedViolations[index];
                            return GestureDetector(
                              onTap: () =>
                                  controller.onTapOnViolationToViewDetails(
                                context,
                                violation.id,
                              ),
                              child: Container(
                                padding: EdgeInsetsDirectional.only(
                                  top: ManagerHeight.h10,
                                  bottom: ManagerHeight.h10,
                                  start: ManagerWidth.w12,
                                  end: ManagerWidth.w12,
                                ),
                                margin: EdgeInsetsDirectional.only(
                                  bottom: ManagerHeight.h10,
                                ),
                                decoration: BoxDecoration(
                                  color: context.theme.colorScheme.outline,
                                  borderRadius:
                                      BorderRadius.circular(ManagerRadius.r5),
                                ),
                                child: Column(
                                  children: [
                                    CustomItemCardOfListOfViolation(
                                      text: violation.driverName,
                                      icon: Icons.person,
                                    ),
                                    CustomItemCardOfListOfViolation(
                                      text: violation.violationDate,
                                      icon: Icons.calendar_month,
                                    ),
                                    CustomItemCardOfListOfViolation(
                                      text: violation.violationAddress,
                                      icon: Icons.location_on,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                } else ...{
                  Center(
                    child: Text(
                      ManagerStrings.noViolationHasBeenRegistered,
                      style: context.textTheme
                          .textStyleOfNoViolationHasBeenRegistered(context),
                    ),
                  ),
                }
              ],
            ),
          ),
        );
      },
    );
  }
}
