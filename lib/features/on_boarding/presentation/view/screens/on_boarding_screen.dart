import '/config/all_imports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<OnBoardingController>(
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: (value) {
                        controller.changeCurrentPage(value);
                      },
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
                      expansionFactor:
                          AppConstants.expansionFactorOfSmoothPageIndicator,
                      activeDotColor: context.theme.primaryColor,
                      dotColor: context.theme.unselectedWidgetColor,
                    ),
                  ),
                  verticalSpace(ManagerHeight.h42),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SizedBox(
                        height: ManagerHeight.h55,
                        width: ManagerWidth.w55,
                        child: CircularProgressIndicator(
                          color: context.theme.progressIndicatorTheme.color,
                          backgroundColor: context.theme.progressIndicatorTheme
                              .refreshBackgroundColor,
                          value: controller.valueOfIndicator,
                          strokeWidth: AppConstants
                              .strokeWidthOfCircularProgressIndicator,
                        ),
                      ),
                      mainButton(
                        onPressed: () => controller.nextPage(context),
                        shape: const CircleBorder(),
                        height: ManagerHeight.h49,
                        child: Icon(
                          Icons.arrow_forward,
                          color: context.theme.iconTheme.color,
                          size: context.theme.iconTheme.size,
                        ),
                      ),
                    ],
                  ),
                  MoveButton(
                    value: controller.valueOfIndicator,
                    onPressed: () => controller.nextPage(context),
                  ),
                  verticalSpace(ManagerHeight.h42),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
