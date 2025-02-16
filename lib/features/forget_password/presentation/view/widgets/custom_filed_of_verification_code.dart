import '/config/all_imports.dart';

class CustomFiledOfVerificationCode extends StatelessWidget {
  const CustomFiledOfVerificationCode({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.changeBorderColor,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  final bool changeBorderColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          end: ManagerWidth.w6,
          bottom: ManagerHeight.h10,
        ),
        child: CustomTextField(
          controller: controller,
          autofocus: true,
          maxLength: AppConstants.maxLengthOfVerificationCode,
          textAlign: TextAlign.center,
          focusNode: focusNode,
          onChanged: onChanged,
          inputTextStyle: context.textTheme
              .textInputInCustomFiledOfVerificationCode(context),
          borderColor: changeBorderColor
              ? context.theme.primaryColor
              : context.theme.inputDecorationTheme.border!.borderSide.color,
          minHeightConstraints: ManagerHeight.h64,
          contentPadding: EdgeInsetsDirectional.only(
            bottom: ManagerHeight.h24,
          ),
        ),
      ),
    );
  }
}
