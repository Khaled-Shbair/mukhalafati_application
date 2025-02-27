import '/config/all_imports.dart';

class CustomCardOfResultTest extends StatelessWidget {
  const CustomCardOfResultTest({
    required this.testType,
    this.isSuccessful = true,
    super.key,
  });

  final String testType;
  final bool isSuccessful;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ManagerWidth.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
        ),
        color: isSuccessful
            ? ManagerColors.grannySmithApple
            : ManagerColors.begonia,
        margin: EdgeInsetsDirectional.only(
          bottom: ManagerHeight.h15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(ManagerHeight.h32),
            Text(
              testType,
              style: context.textTheme.textStyleOfTitleAndSubTitleOfResultTest(
                  context, isSuccessful, true),
            ),
            verticalSpace(ManagerHeight.h16),
            Text(
              isSuccessful ? ManagerStrings.successful : ManagerStrings.failed,
              style: context.textTheme.textStyleOfTitleAndSubTitleOfResultTest(
                  context, isSuccessful, false),
            ),
            verticalSpace(ManagerHeight.h30),
          ],
        ),
      ),
    );
  }
}
