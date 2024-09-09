import '/config/all_imports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<OnBoardingController>(
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      PageView(
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
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: ManagerHeight.h30,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: controller.isNotFirstPage(),
                              child: IconButton(
                                onPressed: () {
                                  controller.previousPage();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: ManagerColors.darkPurple,
                                  size: 20,
                                ),
                              ),
                            ),
                            skipButton(
                              visible: controller.appearSkipButton,
                              onPressed: () => controller.skip(),
                            ),
                          ],
                        ),
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
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      height: ManagerHeight.h55,
                      width: ManagerWidth.w55,
                      child: CircularProgressIndicator(
                        color: ManagerColors.primaryColor,
                        backgroundColor: ManagerColors.blanchedAlmond,
                        value: controller.valueOfIndicator,
                        strokeWidth:
                            AppConstants.strokeWidthOfCircularProgressIndicator,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.nextPage();
                      },
                      child: CircleAvatar(
                        backgroundColor: ManagerColors.primaryColor,
                        radius: ManagerRadius.r24,
                        child: const Icon(
                          Icons.arrow_forward,
                          color: ManagerColors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h26),
              ],
            ),
          );
        },
      ),
    );
  }
}
