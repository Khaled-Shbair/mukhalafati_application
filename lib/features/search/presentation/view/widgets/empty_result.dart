import '/config/all_imports.dart';

Widget emptyResult({required String text}) {
  return Column(
    children: [
      SizedBox(height: ManagerHeight.h70),
      SizedBox(
        width: ManagerWidth.w181,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: ManagerFontFamily.cairo,
            fontSize: ManagerFontsSizes.f13,
            fontWeight: ManagerFontWeight.semiBold,
            color: ManagerColors.spanishGray,
          ),
        ),
      ),
      SizedBox(height: ManagerHeight.h26),
      SvgPicture.asset(
        ManagerAssets.emptyResultSearch,
        height: ManagerHeight.h304,
        width: ManagerWidth.w282,
        fit: BoxFit.cover,
      ),
    ],
  );
}
