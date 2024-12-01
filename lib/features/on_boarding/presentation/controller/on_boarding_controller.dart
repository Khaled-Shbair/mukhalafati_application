import '/config/all_imports.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  int currentPage = 0;
  double valueOfIndicator = 0.3;
  bool appearSkipButton = true;
  List<PageViewContent> pageViewItems = [
    PageViewContent(
      image: ManagerAssets.onBoardingOne,
      title: ManagerStrings.policeMan,
      subTitle: ManagerStrings.subTitleOnBoardingOne,
    ),
    PageViewContent(
      image: ManagerAssets.onBoardingTwo,
      title: ManagerStrings.theDriver,
      subTitle: ManagerStrings.subTitleOnBoardingTwo,
    ),
    PageViewContent(
      image: ManagerAssets.onBoardingThree,
      title: ManagerStrings.violations,
      subTitle: ManagerStrings.subTitleOnBoardingThree,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  bool _isLastPage() => currentPage == pageViewItems.length - 1;

  bool isNotFirstPage() => currentPage != 0;

  void _changeStateOfSkipButton() {
    if (_isLastPage()) {
      appearSkipButton = false;
    } else {
      appearSkipButton = true;
    }
  }

  void changeCurrentPage(int page) {
    currentPage = page;
    _valueOfIndicator();
    _changeStateOfSkipButton();
    update();
  }

  void _valueOfIndicator() {
    if (currentPage == 0) {
      valueOfIndicator = 0.30;
    } else if (currentPage == 1) {
      valueOfIndicator = 0.60;
    } else {
      valueOfIndicator = 1;
    }
  }

  void nextPage() {
    if (_isLastPage()) {
      _moveToWelcomeScreen();

      SharedPreferencesController.setData(SharedPreferencesKeys.language, 'ar');
      SharedPreferencesController.setData(
          SharedPreferencesKeys.onBoarding, true);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInCubic,
      );
    }
    update();
  }

  void _moveToWelcomeScreen() {
    Get.offAllNamed(Routes.welcomeScreen);
  }
}
