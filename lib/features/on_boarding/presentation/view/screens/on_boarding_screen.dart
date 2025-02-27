import '/config/all_imports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
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
                      dotColor: context.theme.disabledColor,
                    ),
                  ),
                  verticalSpace(ManagerHeight.h42),
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
