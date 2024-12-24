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
              menuButton(() => controller.openEndDrawer()),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.complaintsSubmitted,
                      style: context.textTheme
                          .titleListOfComplaintsScreenAndStyleOfTextInEmptyTable(context),
                    ),
                    horizontalSpace(ManagerWidth.w10),
                    CustomButton(
                      height: ManagerHeight.h32,
                      minWidth: ManagerWidth.w120,
                      padding: EdgeInsetsDirectional.only(
                        start: ManagerWidth.w6,
                      ),
                      onPressed: () => controller.submitComplaintButton(),
                      child: SizedBox(
                        width: ManagerWidth.w120,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: context.theme.colorScheme.surface,
                              size: ManagerIconsSizes.i18,
                            ),
                            horizontalSpace(ManagerWidth.w4),
                            Text(
                              ManagerStrings.submitComplaint,
                              maxLines: 1,
                              style: context.textTheme
                                  .submitComplaintButton(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(ManagerHeight.h20),
                ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    if (controller.loading) ...{
                      CustomLoading(),
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
                                    Container(
                                      alignment: AlignmentDirectional.center,
                                      height: ManagerHeight.h26,
                                      width: ManagerWidth.w50,
                                      margin: EdgeInsetsDirectional.only(
                                        start: ManagerWidth.w4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: controller.data[index].status
                                            ? ManagerColors.grannySmithApple
                                            : ManagerColors.peach,
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r5),
                                      ),
                                      child: Text(
                                        controller.data[index].status
                                            ? ManagerStrings.solved
                                            : ManagerStrings.inProgress,
                                        style: context.textTheme
                                            .statusOfComplaint(context,
                                                controller.data[index].status),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
