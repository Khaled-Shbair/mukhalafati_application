import '/config/all_imports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<OnBoardingController>(builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ManagerColors.transparent,
            elevation: AppConstants.elevationAppBarOnBoardingScreen,
            leadingWidth: AppConstants.leadingWidthAppBarOnBoardingScreen,
            leading: MaterialButton(
              padding: EdgeInsetsDirectional.zero,
              highlightColor: ManagerColors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () => controller.skip(),
              child: Text(
                ManagerStrings.skip,
                style: TextStyle(
                  fontSize: ManagerFontsSizes.f14,
                  fontWeight: ManagerFontWeight.bold,
                  color: ManagerColors.dimGray,
                  fontFamily: ManagerFontFamily.cairo,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  children: [
                    ...List.generate(
                      controller.pageViewItems.length,
                      (index) => controller.pageViewItems[index],
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.pageViewItems.length,
                effect: ExpandingDotsEffect(
                  dotHeight: ManagerHeight.h7,
                  dotWidth: ManagerWidth.w10,
                  spacing: ManagerWidth.w10,
                  expansionFactor: 2,
                  activeDotColor: ManagerColors.primaryColor,
                  dotColor: ManagerColors.darkLiver,
                ),
              ),
              SizedBox(height: ManagerHeight.h42),
            ],
          ),
        );
      }),
    );
  }
}
