import '/config/all_imports.dart';

class CustomEmptyResultSearch extends StatelessWidget {
  const CustomEmptyResultSearch({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(ManagerHeight.h70),
        SizedBox(
          width: ManagerWidth.w181,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: context.textTheme.textStyleOfEmptyResultSearch(context),
          ),
        ),
        verticalSpace(ManagerHeight.h26),
        SvgPicture.asset(
          ManagerAssets.emptyResultSearch,
          height: ManagerHeight.h304,
          width: ManagerWidth.w282,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
