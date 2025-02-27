import '/config/all_imports.dart';

class CustomBoxOfNumberOfViolationDriver extends StatelessWidget {
  const CustomBoxOfNumberOfViolationDriver({
    required this.isPaid,
    required this.counter,
    super.key,
  });

  final bool isPaid;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h112,
      alignment: AlignmentDirectional.center,
      margin: EdgeInsetsDirectional.only(
        bottom: ManagerHeight.h36,
      ),
      decoration: BoxDecoration(
        color: isPaid
            ? context.theme.colorScheme.surfaceContainer
            : context.theme.colorScheme.onSecondaryContainer,
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isPaid
              ? SizedBox(
                  height: ManagerHeight.h36,
                  child: Icon(
                    Icons.attach_money,
                    color: context.theme.colorScheme.onError,
                    size: ManagerIconsSizes.i34,
                  ),
                )
              : SizedBox(
                  height: ManagerHeight.h36,
                  child: Icon(
                    Icons.priority_high,
                    color: context.theme.colorScheme.scrim,
                    size: ManagerIconsSizes.i34,
                  ),
                ),
          verticalSpace(ManagerHeight.h5),
          Text(
            '$counter ${isPaid ? ManagerStrings.paid : ManagerStrings.unPaid}',
            style: context.textTheme.textStyleOfIsPaidOrUnPaid(context, isPaid),
          ),
        ],
      ),
    );
  }
}
