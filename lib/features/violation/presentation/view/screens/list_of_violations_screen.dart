import '/config/all_imports.dart';

class ListOfViolationsScreen extends StatelessWidget {
  const ListOfViolationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOfViolationsController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: ManagerColors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ManagerColors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            surfaceTintColor: ManagerColors.transparent,
            title: Text(
              ManagerStrings.listOfViolations,
              style: TextStyle(
                color: ManagerColors.black,
                fontFamily: ManagerFontFamily.cairo,
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontsSizes.f17,
              ),
            ),
            actions: [
              mainButton(
                onPressed: () => controller.openEndDrawer(),
                minWidth: ManagerWidth.w30,
                height: ManagerHeight.h30,
                color: ManagerColors.transparent,
                highlightColor: ManagerColors.transparent,
                splashColor: ManagerColors.transparent,
                side: BorderSide.none,
                child: Icon(
                  Icons.menu,
                  color: ManagerColors.black,
                  size: ManagerIconsSizes.i30,
                ),
              ),
            ],
          ),
          endDrawer: policeManDrawer(
            isListOfViolationsScreen: true,
            policeName: controller.policeName,
            policeImage: controller.policeImage,
          ),
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(
                          end: ManagerWidth.w12,
                        ),
                        padding: EdgeInsetsDirectional.only(
                          top: ManagerHeight.h5,
                          bottom: ManagerHeight.h5,
                        ),
                        decoration: BoxDecoration(
                          color: ManagerColors.lotion,
                          borderRadius: BorderRadius.circular(ManagerRadius.r5),
                        ),
                        child: itemCardOfListOfViolation(
                          text: ManagerStrings.date,
                          icon: Icons.calendar_month,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                          top: ManagerHeight.h5,
                          bottom: ManagerHeight.h5,
                        ),
                        decoration: BoxDecoration(
                          color: ManagerColors.lotion,
                          borderRadius: BorderRadius.circular(ManagerRadius.r5),
                        ),
                        child: itemCardOfListOfViolation(
                          text: ManagerStrings.regions,
                          icon: Icons.location_on,
                          trailing: Icon(
                            Icons.keyboard_arrow_down,
                            color: ManagerColors.black,
                            size: ManagerIconsSizes.i24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h10),
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
                              color: ManagerColors.lotion,
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r5),
                            ),
                            child: Column(
                              children: [
                                itemCardOfListOfViolation(
                                  text: controller.data[index].name,
                                  icon: Icons.person,
                                ),
                                itemCardOfListOfViolation(
                                  text: controller.data[index].date,
                                  icon: Icons.calendar_month,
                                ),
                                itemCardOfListOfViolation(
                                  text: controller.data[index].place,
                                  icon: Icons.location_on,
                                ),
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
