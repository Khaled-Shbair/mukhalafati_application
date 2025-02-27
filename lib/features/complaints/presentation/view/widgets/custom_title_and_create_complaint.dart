import '/config/all_imports.dart';

class CustomTitleAndCreateComplaint extends StatelessWidget {
  const CustomTitleAndCreateComplaint({
    required this.createComplaint,
    super.key,
  });

  final void Function(BuildContext context) createComplaint;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          ManagerStrings.complaintsSubmitted,
          style: context.textTheme
              .titleListOfComplaintsScreenAndStyleOfTextInEmptyTable(context),
        ),
        CustomButton(
          height: ManagerHeight.h32,
          minWidth: ManagerWidth.w120,
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w6,
          ),
          onPressed: () => createComplaint(context),
          child: SizedBox(
            width: ManagerWidth.w119,
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
                  style: context.textTheme.submitComplaintButton(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
