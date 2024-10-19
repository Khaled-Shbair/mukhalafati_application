import '/config/all_imports.dart';

class OnBoardingController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();
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

  void _changeStateOfSkipButton() {
    if (_isLastPage()) {
      appearSkipButton = false;
    } else {
      appearSkipButton = true;
    }
  }

  void skip() {
    pageController.animateToPage(
      2,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInCubic,
    );
    update();
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
      _appSettingsSharedPreferences.setOnBoardingViewed();
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInCubic,
      );
    }
    update();
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInCubic,
    );
    update();
  }

  void _moveToWelcomeScreen() {
    createDoctorAccount();
    createSajaAccount();
    createMalakAccount();
    createGeneenAccount();
    createShahedAccount();
    createPoliceAccount();
    createTest();
    Get.offAllNamed(Routes.welcomeScreen);
  }

  bool _isLastPage() {
    return currentPage == pageViewItems.length - 1;
  }

  bool isNotFirstPage() {
    return currentPage != 0;
  }
}
