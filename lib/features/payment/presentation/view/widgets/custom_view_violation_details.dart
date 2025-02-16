import '/config/all_imports.dart';

class CustomViewViolationDetails extends StatelessWidget {
  const CustomViewViolationDetails({
    required this.payNowButton,
    required this.closeButton,
    required this.date,
    required this.isPaid,
    required this.timeOfViolation,
    required this.numberOfViolation,
    required this.placeOfViolation,
    required this.price,
    required this.reasonForViolation,
    super.key,
  });

  final Function() payNowButton;
  final Function() closeButton;
  final String date;
  final bool isPaid;
  final String timeOfViolation;
  final String numberOfViolation;
  final String placeOfViolation;
  final String price;
  final String reasonForViolation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w16,
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
          color: context.theme.colorScheme.surface,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomHeadOfOfficialPaper(),
            verticalSpace(ManagerHeight.h12),
            Divider(
              color: ManagerColors.black,
              thickness: ManagerHeight.h05,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w4,
                end: ManagerWidth.w4,
                top: ManagerHeight.h6,
                bottom: ManagerHeight.h20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${ManagerStrings.date}: $date',
                    style: context.textTheme.textStyleOfDateOfViolation(),
                  ),
                  Text(
                    'NO: ${numberOfViolation.padLeft(6, '0')}',
                    style: context.textTheme.textStyleOfNumberOfViolation(),
                  ),
                ],
              ),
            ),
            Text(
              ManagerStrings.violationDetails,
              textAlign: TextAlign.center,
              style: context.textTheme.textStyleOfTitleOfViolation(),
            ),
            verticalSpace(ManagerHeight.h15),
            _CustomBoxOfDetails(
                title:
                    '${ManagerStrings.reasonForViolation}: $reasonForViolation'),
            verticalSpace(ManagerHeight.h10),
            _CustomBoxOfDetails(
                title: '${ManagerStrings.placeOfViolation}: $placeOfViolation'),
            verticalSpace(ManagerHeight.h10),
            _CustomBoxOfDetails(
                title: '${ManagerStrings.violationDate}:  $date'),
            verticalSpace(ManagerHeight.h10),
            _CustomBoxOfDetails(
                title: '${ManagerStrings.violationTime}:  $timeOfViolation'),
            verticalSpace(ManagerHeight.h10),
            _CustomBoxOfDetails(
                title:
                    '${ManagerStrings.violationAmount}:  $price ${ManagerStrings.shekel}'),
            verticalSpace(ManagerHeight.h30),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: closeButton,
                    backgroundColor: ManagerColors.antiFlashWhite,
                    side: BorderSide.none,
                    child: Text(
                      ManagerStrings.close,
                      style: context.textTheme
                          .cancelCreateComplaintButtonAndCloseButton(context),
                    ),
                  ),
                ),
                horizontalSpace(ManagerWidth.w10),
                Visibility(
                  visible: isPaid == false,
                  child: Expanded(
                    flex: 2,
                    child: CustomButton(
                      onPressed: payNowButton,
                      minWidth: ManagerWidth.w169,
                      child: Text(
                        ManagerStrings.payNow,
                        style:
                            context.textTheme.textStyleOfPayNowButton(context),
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
}

class _CustomBoxOfDetails extends StatelessWidget {
  const _CustomBoxOfDetails({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
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
        style: context.textTheme.textStyleOfDetailsOfViolation(context),
      ),
    );
  }
}
