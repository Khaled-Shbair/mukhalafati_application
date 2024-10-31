import '/config/all_imports.dart';

Widget viewViolationDetails({
  required Function() payNowButton,
  required Function() closeButton,
  required String date,
  required bool isPaid,
  required String timeOfViolation,
  required String numberOfViolation,
  required String placeOfViolation,
  required String price,
  required String reasonForViolation,
}) {
  return Center(
    child: Container(
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w18,
        end: ManagerWidth.w18,
        bottom: ManagerHeight.h28,
        top: ManagerHeight.h16,
      ),
      margin: EdgeInsetsDirectional.only(
        start: ManagerWidth.w20,
        end: ManagerWidth.w20,
        bottom: ManagerHeight.h50,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        color: ManagerColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          headOfOfficialPaper(),
          Divider(
            color: ManagerColors.black,
            thickness: ManagerHeight.h05,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w4,
              end: ManagerWidth.w4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${ManagerStrings.date}: $date',
                  style: TextStyle(
                    color: ManagerColors.black,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.medium,
                    fontSize: ManagerFontsSizes.f9,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'NO: $numberOfViolation',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: ManagerColors.black,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.medium,
                    fontSize: ManagerFontsSizes.f11,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ManagerHeight.h20),
          Text(
            ManagerStrings.violationDetails,
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: ManagerColors.black,
              fontFamily: ManagerFontFamily.cairo,
              fontWeight: ManagerFontWeight.bold,
              fontSize: ManagerFontsSizes.f15,
            ),
          ),
          SizedBox(height: ManagerHeight.h12),
          _boxOfDetails(
              '${ManagerStrings.reasonForViolation}: $reasonForViolation'),
          SizedBox(height: ManagerHeight.h10),
          _boxOfDetails(
              '${ManagerStrings.placeOfViolation}: $placeOfViolation'),
          SizedBox(height: ManagerHeight.h10),
          _boxOfDetails('${ManagerStrings.violationDate}:  $date'),
          SizedBox(height: ManagerHeight.h10),
          _boxOfDetails('${ManagerStrings.violationTime}:  $timeOfViolation'),
          SizedBox(height: ManagerHeight.h10),
          _boxOfDetails(
              '${ManagerStrings.violationAmount}:  $price ${ManagerStrings.shekel}'),
          SizedBox(height: ManagerHeight.h30),
          Row(
            children: [
              Expanded(
                child: mainButton(
                  onPressed: closeButton,
                  color: ManagerColors.antiFlashWhite,
                  side: BorderSide.none,
                  child: Text(
                    ManagerStrings.close,
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.semiBold,
                      fontSize: ManagerFontsSizes.f15,
                    ),
                  ),
                ),
              ),
              SizedBox(width: ManagerWidth.w10),
              Visibility(
                visible: isPaid == false,
                child: Expanded(
                  flex: 2,
                  child: mainButton(
                    onPressed: payNowButton,
                    minWidth: ManagerWidth.w169,
                    child: Text(
                      ManagerStrings.payNow,
                      style: TextStyle(
                        color: ManagerColors.white,
                        fontFamily: ManagerFontFamily.cairo,
                        fontWeight: ManagerFontWeight.bold,
                        fontSize: ManagerFontsSizes.f15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _boxOfDetails(String title) {
  return Container(
    width: ManagerWidth.infinity,
    alignment: AlignmentDirectional.centerStart,
    padding: EdgeInsetsDirectional.only(
      start: ManagerWidth.w10,
      end: ManagerWidth.w10,
      top: ManagerHeight.h10,
      bottom: ManagerHeight.h10,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
      border: Border.all(
        color: ManagerColors.lightSilver,
        width: ManagerHeight.h05,
      ),
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: ManagerColors.black,
        fontFamily: ManagerFontFamily.cairo,
        fontWeight: ManagerFontWeight.medium,
        fontSize: ManagerFontsSizes.f12,
      ),
    ),
  );
}
