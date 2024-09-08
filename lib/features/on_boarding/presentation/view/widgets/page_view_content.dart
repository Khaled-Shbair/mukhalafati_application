import '/config/all_imports.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    required this.image,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: ManagerWidth.infinity,
          height: ManagerHeight.h405,
          fit: BoxFit.cover,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: ManagerFontsSizes.f22,
            fontWeight: ManagerFontWeight.bold,
            fontFamily: ManagerFontFamily.cairo,
            color: ManagerColors.black,
          ),
        ),
        Container(
          // height: ManagerHeight.h137,
          margin: EdgeInsetsDirectional.only(
            start: ManagerWidth.w38,
            end: ManagerWidth.w38,
            top: ManagerHeight.h16,
            bottom: ManagerHeight.h44,
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ManagerFontsSizes.f15,
              fontWeight: ManagerFontWeight.regular,
              fontFamily: ManagerFontFamily.cairo,
              color: ManagerColors.davyGrey,
              height: 1.8,
            ),
          ),
        ),
      ],
    );
  }
}
