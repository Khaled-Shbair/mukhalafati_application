import '/config/all_imports.dart';

Widget tabBarItemPoliceMan(String text) {
  return Container(
    width: ManagerWidth.infinity,
    alignment: AlignmentDirectional.center,
    padding: EdgeInsetsDirectional.only(
      bottom: ManagerHeight.h12,
      top: ManagerHeight.h12,
    ),
    decoration: BoxDecoration(
      color: ManagerColors.transparent,
      border: Border.all(
        color: ManagerColors.primaryColor,
        width: ManagerHeight.h1,
      ),
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    child: Text(text),
  );
}
