import '/config/all_imports.dart';

Widget paymentMethod({
  required String image,
  required String name,
  required Function() onTap,
  bool selected = true,
}) {
  return Container(
    margin: EdgeInsetsDirectional.only(bottom: ManagerHeight.h10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
      border: Border.all(
        color:
            selected ? ManagerColors.primaryColor : ManagerColors.lightSilver,
        width: ManagerWidth.w1,
      ),
    ),
    child: ListTile(
      selected: selected,
      onTap: onTap,
      splashColor: ManagerColors.transparent,
      selectedColor: Colors.red,
      leading: Image.asset(
        image,
        height: ManagerHeight.h36,
        width: ManagerWidth.w35,
      ),
      title: Text(
        name,
        style: TextStyle(
          color: ManagerColors.black,
          fontSize: ManagerFontsSizes.f14,
          fontWeight: ManagerFontWeight.medium,
          fontFamily: ManagerFontFamily.cairo,
        ),
      ),
      trailing: Icon(
        Icons.check_circle,
        color: selected ? ManagerColors.primaryColor : ManagerColors.gainsBoro,
        size: ManagerIconsSizes.i24,
      ),
    ),
  );
}
