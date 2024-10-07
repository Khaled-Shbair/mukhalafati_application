import '/config/all_imports.dart';

Widget boxOfNotification({
  Color? color,
  Color? colorText,
  Color? colorTime,
  required String text,
  required String time,
  required Function() onLongPress,
}) {
  return GestureDetector(
    onLongPress: onLongPress,
    child: Container(
      height: ManagerHeight.h98,
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w10,
        top: ManagerHeight.h10,
        bottom: ManagerHeight.h10,
        end: ManagerWidth.w4,
      ),
      decoration: BoxDecoration(
        color: color ?? ManagerColors.lotion2,
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: colorText ?? ManagerColors.black,
              fontSize: ManagerFontsSizes.f12,
              fontFamily: ManagerFontFamily.cairo,
              fontWeight: ManagerFontWeight.medium,
            ),
          ),
          SizedBox(height: ManagerHeight.h5),
          Text(
            '${ManagerStrings.since} $time',
            style: TextStyle(
              color: colorTime ?? ManagerColors.black50,
              fontSize: ManagerFontsSizes.f10,
              fontFamily: ManagerFontFamily.cairo,
              fontWeight: ManagerFontWeight.semiBold,
            ),
          ),
        ],
      ),
    ),
  );
}
