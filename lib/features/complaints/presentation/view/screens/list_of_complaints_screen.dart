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
          endDrawer: driverDrawer(
            isListOfComplaintsScreen: true,
            driverName: controller.driverName,
            driverImage: controller.driverImage,
          ),
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
              color: ManagerColors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r5),
              boxShadow: [
                BoxShadow(
                  color: ManagerColors.black5,
                  offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                  blurRadius: AppConstants
                      .blurRadiusOfBoxShadowInListOfComplaintsScreen,
                  spreadRadius: AppConstants
                      .blurRadiusOfBoxShadowInListOfComplaintsScreen,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        ManagerStrings.complaintsSubmitted,
                        style: TextStyle(
                          color: ManagerColors.black,
                          fontFamily: ManagerFontFamily.cairo,
                          fontWeight: ManagerFontWeight.semiBold,
                          fontSize: ManagerFontsSizes.f12,
                        ),
                      ),
                    ),
                    SizedBox(width: ManagerWidth.w48),
                    Expanded(
                      child: mainButton(
                        height: ManagerHeight.h16,
                        padding: EdgeInsetsDirectional.only(
                          start: ManagerWidth.w6,
                          end: ManagerWidth.w12,
                        ),
                        onPressed: () => controller.submitComplaintButton(),
                        child: ListTile(
                          minTileHeight: ManagerHeight.h0,
                          minLeadingWidth: ManagerWidth.w0,
                          horizontalTitleGap: ManagerWidth.w4,
                          contentPadding: EdgeInsetsDirectional.zero,
                          leading: Icon(
                            Icons.add,
                            color: ManagerColors.white,
                            size: ManagerIconsSizes.i18,
                          ),
                          title: Text(
                            ManagerStrings.submitComplaint,
                            style: TextStyle(
                              color: ManagerColors.white,
                              fontFamily: ManagerFontFamily.cairo,
                              fontWeight: ManagerFontWeight.bold,
                              fontSize: ManagerFontsSizes.f11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h20),
                Expanded(
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      if (controller.loading) ...{
                        myLoading(),
                      } else if (controller.data.isNotEmpty &&
                          controller.loading == false) ...{
                        CustomTable(
                          columns: [
                            dataColumnOfComplaintsTable(AppConstants.hash),
                            dataColumnOfComplaintsTable(ManagerStrings.date),
                            dataColumnOfComplaintsTable(
                                ManagerStrings.complaint),
                            dataColumnOfComplaintsTable(ManagerStrings.state),
                          ],
                          rows: [
                            ...List.generate(
                              controller.data.length,
                              (index) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        '${index + 1}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ManagerColors.black50,
                                          fontFamily: ManagerFontFamily.cairo,
                                          fontSize: ManagerFontsSizes.f12,
                                          fontWeight:
                                              ManagerFontWeight.semiBold,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: ManagerWidth.w6,
                                          end: ManagerWidth.w4,
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          controller.data[index]
                                              .dateOfIncidentOrProblem,
                                          style: TextStyle(
                                            color: ManagerColors.black50,
                                            fontFamily: ManagerFontFamily.cairo,
                                            fontSize: ManagerFontsSizes.f12,
                                            fontWeight:
                                                ManagerFontWeight.semiBold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      placeholder: true,
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: ManagerWidth.w4,
                                          end: ManagerWidth.w1,
                                        ),
                                        child: Text(
                                          controller
                                              .data[index].detailOfComplaint,
                                          style: TextStyle(
                                            color: ManagerColors.black50,
                                            fontFamily: ManagerFontFamily.cairo,
                                            fontSize: ManagerFontsSizes.f12,
                                            fontWeight:
                                                ManagerFontWeight.semiBold,
                                          ),
                                        ),
                                      ),
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
                                          style: TextStyle(
                                            color: controller.data[index].status
                                                ? ManagerColors.mayGreen
                                                : ManagerColors.harvestGold,
                                            fontFamily: ManagerFontFamily.cairo,
                                            fontSize: ManagerFontsSizes.f9,
                                            fontWeight:
                                                ManagerFontWeight.semiBold,
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
                      )
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
