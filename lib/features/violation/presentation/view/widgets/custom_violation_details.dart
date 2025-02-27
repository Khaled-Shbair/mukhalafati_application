import '/config/all_imports.dart';

class CustomViolationDetails extends StatelessWidget {
  const CustomViolationDetails({
    required this.closeButton,
    required this.driverName,
    required this.driverIdNumber,
    required this.ownerName,
    required this.ownerIdNumber,
    required this.notificationEditorName,
    required this.date,
    required this.vehicleNumber,
    required this.timeOfViolation,
    required this.numberOfViolation,
    required this.placeOfViolation,
    required this.vehicleType,
    required this.dateNow,
    required this.vehicleColor,
    required this.reasonForViolation,
    super.key,
  });

  final Function() closeButton;
  final String driverName;
  final String driverIdNumber;
  final String ownerName;
  final String ownerIdNumber;
  final String notificationEditorName;
  final String vehicleNumber;
  final String vehicleType;
  final String vehicleColor;
  final String date;
  final String dateNow;
  final String timeOfViolation;
  final String numberOfViolation;
  final String placeOfViolation;
  final String reasonForViolation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsetsDirectional.only(
          end: ManagerWidth.w16,
          bottom: ManagerHeight.h2,
          top: ManagerHeight.h6,
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
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomButton(
                    onPressed: closeButton,
                    height: ManagerHeight.h24,
                    minWidth: ManagerWidth.w24,
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.close,
                      color: ManagerColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: ManagerHeight.h20,
                    start: ManagerWidth.w22,
                  ),
                  child: CustomHeadOfOfficialPaper(),
                ),
              ],
            ),
            verticalSpace(ManagerHeight.h12),
            Divider(
              color: ManagerColors.black,
              thickness: ManagerHeight.h05,
              indent: ManagerWidth.w18,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w20,
                top: ManagerHeight.h6,
                end: ManagerWidth.w6,
                bottom: ManagerHeight.h6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${ManagerStrings.date}: $dateNow',
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
              ManagerStrings.documentReservationNotice,
              textAlign: TextAlign.center,
              style: context.textTheme.textStyleOfTitleOfViolation(),
            ),
            verticalSpace(ManagerHeight.h10),
            _CustomBoxOfDetails(
              title: '${ManagerStrings.driverName}: $driverName',
              marginStart: ManagerWidth.w16,
            ),
            _CustomBoxOfDetails(
              title: '${ManagerStrings.driverIdNumber}: $driverIdNumber',
              marginStart: ManagerWidth.w16,
            ),
            _CustomBoxOfDetails(
              title: '${ManagerStrings.ownerName}: $ownerName',
              marginStart: ManagerWidth.w16,
            ),
            _CustomBoxOfDetails(
              title: '${ManagerStrings.ownerIdNumber}: $ownerIdNumber',
              marginStart: ManagerWidth.w16,
            ),
            Row(
              children: [
                Expanded(
                  child: _CustomBoxOfDetails(
                    title: '${ManagerStrings.vehicleNumber}:\n$vehicleNumber',
                    alignment: AlignmentDirectional.center,
                    marginStart: ManagerWidth.w16,
                    paddingVertical: ManagerHeight.h0,
                  ),
                ),
                Expanded(
                  child: _CustomBoxOfDetails(
                    title: '${ManagerStrings.vehicleType}:\n$vehicleType',
                    alignment: AlignmentDirectional.center,
                    marginStart: ManagerWidth.w8,
                    paddingVertical: ManagerHeight.h0,
                  ),
                ),
                Expanded(
                  child: _CustomBoxOfDetails(
                    title: '${ManagerStrings.vehicleColor}:\n$vehicleColor',
                    marginStart: ManagerWidth.w8,
                    alignment: AlignmentDirectional.center,
                    paddingVertical: ManagerHeight.h0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _CustomBoxOfDetails(
                    title: '${ManagerStrings.violationDate}:\n$date',
                    alignment: AlignmentDirectional.center,
                    marginStart: ManagerWidth.w16,
                    paddingVertical: ManagerHeight.h0,
                  ),
                ),
                Expanded(
                  child: _CustomBoxOfDetails(
                    title: '${ManagerStrings.violationTime}:\n$timeOfViolation',
                    alignment: AlignmentDirectional.center,
                    marginStart: ManagerWidth.w8,
                    paddingVertical: ManagerHeight.h0,
                  ),
                ),
              ],
            ),
            _CustomBoxOfDetails(
              title: '${ManagerStrings.placeOfViolation}: $placeOfViolation',
              marginStart: ManagerWidth.w16,
            ),
            _CustomBoxOfDetails(
              title:
                  '${ManagerStrings.reasonForViolation}: $reasonForViolation',
              marginStart: ManagerWidth.w16,
            ),
            _CustomBoxOfDetails(
              title:
                  '${ManagerStrings.notificationEditorName}: $notificationEditorName',
              marginStart: ManagerWidth.w16,
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
    this.alignment = AlignmentDirectional.centerStart,
    this.marginStart = 0,
    this.paddingVertical,
  });

  final String title;
  final AlignmentDirectional alignment;
  final double marginStart;
  final double? paddingVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidth.infinity,
      alignment: alignment,
      margin: EdgeInsetsDirectional.only(
        bottom: ManagerHeight.h10,
        start: marginStart,
      ),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidth.w10,
        vertical: paddingVertical ?? ManagerHeight.h10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        border: Border.all(
          color: ManagerColors.lightSilver,
          width: ManagerHeight.h05,
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        title,
        // overflow: TextOverflow.ellipsis,
        style: context.textTheme.textStyleOfDetailsOfViolation(context),
      ),
    );
  }
}
