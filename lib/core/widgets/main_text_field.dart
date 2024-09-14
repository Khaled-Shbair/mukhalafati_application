import '/config/all_imports.dart';

Widget mainTextField({
  required TextEditingController controller,
  required String labelText,
  bool obscureText = false,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.number,
  void Function()? changeObscureText,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: labelText,
      fillColor: ManagerColors.white,
      filled: true,
      labelStyle: TextStyle(
        color: ManagerColors.quartz,
        fontWeight: ManagerFontWeight.medium,
        fontSize: ManagerFontsSizes.f13,
        fontFamily: ManagerFontFamily.cairo,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: const BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: const BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        borderSide: const BorderSide(
          color: ManagerColors.lightSilver,
          width: AppConstants.widthOfBorderSideOfMainTextField,
        ),
      ),
      suffixIcon: isPassword
          ? IconButton(
              onPressed: changeObscureText,
              highlightColor: ManagerColors.transparent,
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: ManagerColors.lightSilver,
              ),
            )
          : null,
    ),
  );
}
