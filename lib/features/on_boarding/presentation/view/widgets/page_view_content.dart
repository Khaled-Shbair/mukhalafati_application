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
          height: context.mediaQuery.size.height * 0.5,
          fit: BoxFit.fill,
        ),
        verticalSpace(ManagerHeight.h5),
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: context.textTheme
              .titleOnBoardingAndWelcomeAndLoginScreen(context),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          margin: EdgeInsetsDirectional.only(
            start: ManagerWidth.w40,
            end: ManagerWidth.w42,
            top: ManagerHeight.h8,
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: context.textTheme.subTitleOnBoardingScreen(context),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
