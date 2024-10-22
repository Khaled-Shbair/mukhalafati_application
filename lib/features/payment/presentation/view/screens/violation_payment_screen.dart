import '/config/all_imports.dart';

class ViolationPaymentScreen extends StatelessWidget {
  const ViolationPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViolationPaymentController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          endDrawer: driverDrawer(
            driverName: controller.driverName,
            driverImage: controller.driverImage,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.payViolations),
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
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h20,
              bottom: ManagerHeight.h20,
            ),
            margin: EdgeInsetsDirectional.only(
              start: ManagerWidth.w24,
              end: ManagerWidth.w24,
              top: ManagerHeight.h28,
              bottom: ManagerHeight.h40,
            ),
            decoration: BoxDecoration(
              color: ManagerColors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r5),
              boxShadow: [
                BoxShadow(
                  color: ManagerColors.black5,
                  blurRadius: AppConstants
                      .blurRadiusOfBoxShadowInViolationPaymentScreen,
                  spreadRadius: AppConstants
                      .spreadRadiusOfBoxShadowInViolationPaymentScreen,
                  offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ManagerStrings.yourViolations,
                  style: TextStyle(
                    color: ManagerColors.primaryColor,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontsSizes.f13,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: ManagerWidth.w85,
                    bottom: ManagerHeight.h20,
                  ),
                  child: Text(
                    ManagerStrings.youCanViewAllYourPaidAndUnpaidViolations,
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.semiBold,
                      fontSize: ManagerFontsSizes.f12,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    if (controller.viewViolations.isNotEmpty) ...{
                      ListView(
                        padding: EdgeInsetsDirectional.only(
                          top: ManagerHeight.h50,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        children: [
                          tableOfViolation(
                            [
                              ...List.generate(
                                controller.viewViolations.length,
                                (index) {
                                  var data = controller.viewViolations[index];
                                  return dataRowOfViolationTable(
                                    numberOfRow: (index + 1).toString(),
                                    price: data.priceOfViolation.toString(),
                                    date: data.violationDate,
                                    isPaid:
                                        data.violationState == 1 ? true : false,
                                    onTap: () {
                                      controller.showViolationButton(
                                        isPaid: data.violationState == 1
                                            ? true
                                            : false,
                                        numberOfViolation:
                                            data.violationId.toString(),
                                        reasonForViolation:
                                            data.violationReason,
                                        placeOfViolation: data.violationAddress,
                                        timeOfViolation: data.violationTime,
                                        violationId: data.violationId,
                                        price: data.priceOfViolation.toString(),
                                        date: data.violationDate,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    } else ...{
                      Container(
                        width: ManagerWidth.w287,
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsetsDirectional.only(
                          top: ManagerHeight.h10,
                          bottom: ManagerHeight.h30,
                        ),
                        decoration: BoxDecoration(
                          color: ManagerColors.transparent,
                          border: Border.all(
                            color: ManagerColors.platinum,
                            width: ManagerWidth.w1,
                          ),
                          borderRadius: BorderRadius.circular(ManagerRadius.r5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                bottom: ManagerHeight.h4,
                                start: ManagerWidth.w10,
                                end: ManagerWidth.w20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textOfHeadViolationTable(AppConstants.hash),
                                  textOfHeadViolationTable(ManagerStrings.date),
                                  textOfHeadViolationTable(
                                      ManagerStrings.amount),
                                  textOfHeadViolationTable(
                                      ManagerStrings.state),
                                ],
                              ),
                            ),
                            Divider(
                              color: ManagerColors.platinum,
                              thickness: ManagerHeight.h1,
                            ),
                            SizedBox(height: ManagerHeight.h20),
                            Text(
                              ManagerStrings.noRecordedViolations,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ManagerColors.black,
                                fontFamily: ManagerFontFamily.cairo,
                                fontSize: ManagerFontsSizes.f12,
                                fontWeight: ManagerFontWeight.semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ExpansionTile(
                            controller: controller.expansionTileController,
                            minTileHeight: ManagerHeight.h34,
                            backgroundColor: ManagerColors.primaryColor,
                            collapsedBackgroundColor:
                                ManagerColors.primaryColor,
                            tilePadding: EdgeInsetsDirectional.only(
                              start: ManagerWidth.w10,
                              end: ManagerWidth.w4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r5),
                            ),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r5),
                              side: BorderSide(
                                width: ManagerWidth.w05,
                                color: ManagerColors.primaryColor,
                              ),
                            ),
                            showTrailingIcon: false,
                            title: ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              horizontalTitleGap: ManagerWidth.w4,
                              minTileHeight: ManagerHeight.h0,
                              minLeadingWidth: ManagerWidth.w0,
                              minVerticalPadding: ManagerWidth.w0,
                              leading: Image.asset(
                                ManagerAssets.filterIcon,
                                height: ManagerHeight.h21,
                                width: ManagerWidth.w23,
                              ),
                              title: Text(
                                controller.filter,
                                style: TextStyle(
                                  color: ManagerColors.white,
                                  fontSize: ManagerFontsSizes.f11,
                                  fontWeight: ManagerFontWeight.bold,
                                  fontFamily: ManagerFontFamily.cairo,
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_down,
                                size: ManagerIconsSizes.i24,
                              ),
                            ),
                            maintainState: true,
                            iconColor: ManagerColors.white,
                            collapsedIconColor: ManagerColors.white,
                            children: [
                              TextButton(
                                onPressed: () => controller.paidButton(),
                                child: Text(
                                  ManagerStrings.paid,
                                  style: TextStyle(
                                    color: ManagerColors.white,
                                    fontSize: ManagerFontsSizes.f11,
                                    fontWeight: ManagerFontWeight.bold,
                                    fontFamily: ManagerFontFamily.cairo,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => controller.unpaidButton(),
                                child: Text(
                                  ManagerStrings.unpaid,
                                  style: TextStyle(
                                    color: ManagerColors.white,
                                    fontSize: ManagerFontsSizes.f11,
                                    fontWeight: ManagerFontWeight.bold,
                                    fontFamily: ManagerFontFamily.cairo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.cancelFilterButton(),
                            style: ElevatedButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size(
                                ManagerWidth.infinity,
                                ManagerHeight.h34,
                              ),
                              backgroundColor: ManagerColors.lotion,
                              elevation: 0,
                              alignment: AlignmentDirectional.center,
                              shadowColor: ManagerColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(ManagerRadius.r5),
                              ),
                              padding: EdgeInsetsDirectional.only(
                                start: ManagerWidth.w11,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              horizontalTitleGap: ManagerWidth.w3,
                              minTileHeight: ManagerHeight.h0,
                              minLeadingWidth: ManagerWidth.w0,
                              minVerticalPadding: ManagerWidth.w0,
                              leading: Image.asset(
                                ManagerAssets.cancelFilterIcon,
                                height: ManagerHeight.h24,
                                width: ManagerWidth.w24,
                              ),
                              title: Text(
                                ManagerStrings.cancelFilter,
                                style: TextStyle(
                                  color: ManagerColors.black,
                                  fontSize: ManagerFontsSizes.f11,
                                  fontWeight: ManagerFontWeight.bold,
                                  fontFamily: ManagerFontFamily.cairo,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w12),
                      ],
                    ),
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
