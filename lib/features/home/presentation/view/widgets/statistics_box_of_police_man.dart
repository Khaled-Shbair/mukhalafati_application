import '/config/all_imports.dart';

Widget statisticsBoxPoliceMan({
  required String title,
  required String subTitle,
}) {
  return Expanded(
    child: Container(
      height: ManagerHeight.h90,
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w6,
        end: ManagerWidth.w6,
        top: ManagerHeight.h12,
        bottom: ManagerHeight.h10,
      ),
      decoration: BoxDecoration(
        color: ManagerColors.white,
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        boxShadow: [
          BoxShadow(
            color: ManagerColors.primaryColor,
            offset: Offset(ManagerWidth.w5, ManagerHeight.h0),
          ),
          BoxShadow(
            color: ManagerColors.black5,
            offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: ManagerFontsSizes.f11,
              fontWeight: ManagerFontWeight.semiBold,
              color: ManagerColors.black,
              fontFamily: ManagerFontFamily.cairo,
            ),
          ),
          SizedBox(height: ManagerHeight.h5),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontSize: ManagerFontsSizes.f15,
              fontWeight: ManagerFontWeight.bold,
              color: ManagerColors.primaryColor,
              fontFamily: ManagerFontFamily.cairo,
            ),
          ),
        ],
      ),
    ),
  );
}
