import '/config/all_imports.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;

  //Current page
  int currentPage = 0;

  //Value of indicator widget
  double valueOfIndicator = 0.3;

  //List to save pages of onboarding screens
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

  //This function check if this page is last page in OnBoarding screens
  bool _isLastPage() => currentPage == pageViewItems.length - 1;

  //This function check if this page is not first page in OnBoarding pages
  bool isNotFirstPage() => currentPage != 0;

  //This function to change a value the page that go to it
  void changeCurrentPage(int page) {
    currentPage = page;
    _valueOfIndicator();
    update();
  }

  //This function to change a value of indicator when move between pages
  //(as animation)
  void _valueOfIndicator() {
    if (currentPage == 0) {
      valueOfIndicator = 0.30;
    } else if (currentPage == 1) {
      valueOfIndicator = 0.60;
    } else {
      valueOfIndicator = 1;
    }
  }

  //This function to move between pages of onBoarding screen
  void nextPage(BuildContext context) {
    if (_isLastPage()) {
      _moveToWelcomeScreen(context);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInCubic,
      );
    }
    update();
  }

  //This function transitions the user to the Welcome screen after
  //completing the OnBoarding.
  void _moveToWelcomeScreen(BuildContext context) {
    //It sets the default language to Arabic.
    SharedPreferencesController.setData(
      SharedPreferencesKeys.language,
      LocaleConstants.arabicLanguage,
    );

    //Move to (Welcome Screen) and remove all previous screens
    context.pushNamedAndRemoveAllUntil(Routes.welcomeScreen);

    //It sets marks the OnBoarding screen as completed, ensuring it will not
    //appear again on subsequent app launches.
    SharedPreferencesController.setData(SharedPreferencesKeys.viewOnBoarding, true);

    //Dispose OnBoarding controller form memory
    disposeOnBoarding();
  }
}
