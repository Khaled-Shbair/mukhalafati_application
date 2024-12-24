import '/config/all_imports.dart';

class ListOfViolationsScreen extends StatelessWidget {
  const ListOfViolationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOfViolationsController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.listOfViolations),
            actions: [
              menuButton(() => controller.openEndDrawer()),
            ],
          ),
          endDrawer: PoliceManDrawer(isListOfViolationsScreen: true),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeight.h20,
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomFilterListViolationsButton(
                      marginEnd: ManagerWidth.w12,
                      child: CustomItemCardOfListOfViolation(
                        text: ManagerStrings.date,
                        icon: Icons.calendar_month,
                      ),
                    ),
                    CustomFilterListViolationsButton(
                      child: CustomItemCardOfListOfViolation(
                        text: ManagerStrings.regions,
                        icon: Icons.location_on,
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: ManagerColors.black,
                          size: ManagerIconsSizes.i24,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(ManagerHeight.h10),
                Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) {
                          return Container(
                            margin: EdgeInsetsDirectional.only(
                              top: ManagerHeight.h10,
                            ),
                            padding: EdgeInsetsDirectional.only(
                              top: ManagerHeight.h10,
                              bottom: ManagerHeight.h10,
                            ),
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.outline,
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r5),
                            ),
                            child: Column(
                              children: [
                                // CustomItemCardOfListOfViolation(
                                //   text: controller.data[index].name,
                                //   icon: Icons.person,
                                // ),
                                // CustomItemCardOfListOfViolation(
                                //   text: controller.data[index].date,
                                //   icon: Icons.calendar_month,
                                // ),
                                // CustomItemCardOfListOfViolation(
                                //   text: controller.data[index].place,
                                //   icon: Icons.location_on,
                                // ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
