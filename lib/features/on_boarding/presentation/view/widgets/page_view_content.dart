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
        verticalSpace(ManagerHeight.h5),
        Text(
          title, style: context.textTheme.titleOnBoardingAndWelcomeAndLoginScreen(context),
          // context.theme.textTheme.titleLarge,
        ),
        Container(
          margin: EdgeInsetsDirectional.only(
            start: ManagerWidth.w24,
            end: ManagerWidth.w24,
            top: ManagerHeight.h16,
            bottom: ManagerHeight.h44,
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: context.textTheme.subTitleOnBoardingScreen(context),
          ),
        ),
      ],
    );
  }
}
