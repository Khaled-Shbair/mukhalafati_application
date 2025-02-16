import '/config/all_imports.dart';

class CustomPaymentMethod extends StatelessWidget {
  const CustomPaymentMethod({
    required this.image,
    required this.name,
    required this.onTap,
    this.selected = true,
    super.key,
  });

  final String image;
  final String name;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: ManagerHeight.h10),
      padding: EdgeInsetsDirectional.only(
        end: ManagerWidth.w10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        border: Border.all(
          color:
              selected ? context.theme.primaryColor : ManagerColors.lightSilver,
          width: ManagerWidth.w1,
        ),
      ),
      child: ListTile(
        selected: selected,
        onTap: onTap,
        splashColor: context.theme.unselectedWidgetColor,
        leading: Image.asset(
          image,
          height: ManagerHeight.h36,
          width: ManagerWidth.w35,
        ),
        title: Text(
          name,
          style: context.textTheme.textStyleOfNameOfPaymentMethod(context),
        ),
        trailing: Icon(
          Icons.check_circle,
          color:
              selected ? context.theme.primaryColor : ManagerColors.gainsBoro,
          size: ManagerIconsSizes.i24,
        ),
      ),
    );
  }
}
