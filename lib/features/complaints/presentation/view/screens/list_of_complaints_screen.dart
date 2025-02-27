import '/config/all_imports.dart';

class ListOfComplaintsScreen extends StatelessWidget {
  const ListOfComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOfComplaintsController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          endDrawer: CustomDriverDrawer(isListOfComplaintsScreen: true),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.listOfComplaints),
            actions: [
              CustomMenuButton(() => controller.openEndDrawer()),
            ],
          ),
          body: Container(
            margin: EdgeInsetsDirectional.only(
              start: ManagerWidth.w24,
              end: ManagerWidth.w24,
              top: ManagerHeight.h24,
              bottom: ManagerHeight.h24,
            ),
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerWidth.w20,
              bottom: ManagerWidth.w32,
            ),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(ManagerRadius.r5),
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.shadow,
                  offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                  blurRadius: AppConstants
                      .blurRadiusOfBoxShadowInListOfComplaintsScreen,
                  spreadRadius: AppConstants
                      .blurRadiusOfBoxShadowInListOfComplaintsScreen,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTitleAndCreateComplaint(
                  createComplaint: controller.submitComplaintButton,
                ),
                verticalSpace(ManagerHeight.h20),
                Flexible(
                  child: ListView(
                    controller: controller.scrollController,
                    shrinkWrap: true,
                    children: [

                      if (controller.loading == true&& controller.data.isEmpty) ...{
                        SizedBox(
                          height: ManagerHeight.h154,
                          child: CustomLoading(),
                        ),
                      } else if (controller.data.isNotEmpty &&
                          controller.loading == false) ...{
                        CustomTable(
                          columns: [
                            ...List.generate(
                              controller.namesOfColumns.length,
                              (index) => customDataColumn(
                                controller.namesOfColumns[index],
                                context,
                              ),
                            ),
                          ],
                          rows: [
                            ...List.generate(
                              controller.data.length,
                              (index) {
                                return DataRow(
                                  cells: [
                                    customFieldOfRow(
                                      '${index + 1}',
                                      context: context,
                                    ),
                                    customFieldOfRow(
                                      context: context,
                                      controller
                                          .data[index].dateOfIncidentOrProblem,
                                      start: ManagerWidth.w6,
                                      end: ManagerWidth.w4,
                                    ),
                                    customFieldOfRow(
                                      context: context,
                                      controller.data[index].detailOfComplaint,
                                      start: ManagerWidth.w4,
                                      end: ManagerWidth.w1,
                                      placeholder: true,
                                    ),
                                    DataCell(
                                      SizedBox(
                                        height: ManagerHeight.h34,
                                        width: ManagerWidth.w60,
                                        child: Card(
                                          color: controller.data[index].status
                                              ? ManagerColors.grannySmithApple
                                              : ManagerColors.peach,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                ManagerRadius.r5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              controller.data[index].status
                                                  ? ManagerStrings.solved
                                                  : ManagerStrings.inProgress,
                                              textAlign: TextAlign.center,
                                              style: context.textTheme
                                                  .statusOfComplaint(
                                                      context,
                                                      controller
                                                          .data[index].status),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      } else ...{
                        CustomEmptyTable(
                          length: controller.namesOfColumns.length,
                          nameOfColumns: controller.namesOfColumns,
                        ),
                      },
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
