import '/config/all_imports.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  List<PageViewContent> pageViewItems = [
    PageViewContent(
      image: ManagerAssets.onBoardingOne,
      title: ManagerStrings.policeMan,
      subTitle: ManagerStrings.subTitleOnBoardingOne,
    ),
    PageViewContent(
      image: ManagerAssets.onBoardingTwo,
      title: ManagerStrings.driver,
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
  void skip(){
    debugPrint('skip');
  }
}
