import '/config/all_imports.dart';

class ListOfComplaintsScreen extends StatelessWidget {
  const ListOfComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOfComplaintsController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: ManagerColors.white,
          resizeToAvoidBottomInset: false,
          endDrawer: driverDrawer(
            isListOfComplaintsScreen: true,
            driverName: controller.driverName,
            driverImage: controller.driverImage,
          ),
          appBar: AppBar(
            backgroundColor: ManagerColors.white,
            centerTitle: true,
            surfaceTintColor: ManagerColors.transparent,
            title: Text(
              ManagerStrings.listOfComplaints,
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
            child: ListView(
              primary: false,
              shrinkWrap: true,
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
                if (controller.data.isNotEmpty) ...{
                  DataTable(
                    border: TableBorder.all(
                      color: ManagerColors.platinum,
                      width: ManagerWidth.w1,
                      borderRadius: BorderRadius.circular(ManagerRadius.r5),
                    ),
                    headingRowHeight: ManagerHeight.h40,
                    dataRowMinHeight: ManagerHeight.h40,
                    columnSpacing: ManagerWidth.w5,
                    horizontalMargin: ManagerWidth.w10,
                    columns: [
                      dataColumnOfComplaintsTable('#'),
                      dataColumnOfComplaintsTable(ManagerStrings.date),
                      dataColumnOfComplaintsTable(ManagerStrings.complaint),
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
                                    fontWeight: ManagerFontWeight.semiBold,
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
                                    controller.data[index].date,
                                    style: TextStyle(
                                      color: ManagerColors.black50,
                                      fontFamily: ManagerFontFamily.cairo,
                                      fontSize: ManagerFontsSizes.f12,
                                      fontWeight: ManagerFontWeight.semiBold,
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
                                    controller.data[index].text,
                                    style: TextStyle(
                                      color: ManagerColors.black50,
                                      fontFamily: ManagerFontFamily.cairo,
                                      fontSize: ManagerFontsSizes.f12,
                                      fontWeight: ManagerFontWeight.semiBold,
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
                                    color: controller.data[index].state
                                        ? ManagerColors.grannySmithApple
                                        : ManagerColors.peach,
                                    borderRadius:
                                        BorderRadius.circular(ManagerRadius.r5),
                                  ),
                                  child: Text(
                                    controller.data[index].state
                                        ? ManagerStrings.solved
                                        : ManagerStrings.inProgress,
                                    style: TextStyle(
                                      color: controller.data[index].state
                                          ? ManagerColors.mayGreen
                                          : ManagerColors.harvestGold,
                                      fontFamily: ManagerFontFamily.cairo,
                                      fontSize: ManagerFontsSizes.f9,
                                      fontWeight: ManagerFontWeight.semiBold,
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
                  DataTable(
                    border: TableBorder.all(
                      color: ManagerColors.platinum,
                      width: ManagerWidth.w1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ManagerRadius.r5),
                        topRight: Radius.circular(ManagerRadius.r5),
                      ),
                    ),
                    headingRowHeight: ManagerHeight.h40,
                    dataRowMinHeight: ManagerHeight.h40,
                    columnSpacing: ManagerWidth.w48,
                    horizontalMargin: ManagerWidth.w10,
                    columns: [
                      dataColumnOfComplaintsTable('#'),
                      dataColumnOfComplaintsTable(ManagerStrings.date),
                      dataColumnOfComplaintsTable(ManagerStrings.complaint),
                      dataColumnOfComplaintsTable(ManagerStrings.state),
                    ],
                    rows: const [],
                  ),
                  Container(
                    height: ManagerHeight.h64,
                    width: ManagerWidth.infinity,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: ManagerColors.transparent,
                      border: Border(
                        left: BorderSide(
                          color: ManagerColors.platinum,
                          width: ManagerWidth.w1,
                        ),
                        right: BorderSide(
                          color: ManagerColors.platinum,
                          width: ManagerWidth.w1,
                        ),
                        bottom: BorderSide(
                          color: ManagerColors.platinum,
                          width: ManagerWidth.w1,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ManagerRadius.r5),
                        bottomRight: Radius.circular(ManagerRadius.r5),
                      ),
                    ),
                    child: Text(
                      ManagerStrings.noComplaintsSubmitted,
                      style: TextStyle(
                        color: ManagerColors.black,
                        fontFamily: ManagerFontFamily.cairo,
                        fontSize: ManagerFontsSizes.f12,
                        fontWeight: ManagerFontWeight.semiBold,
                      ),
                    ),
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
