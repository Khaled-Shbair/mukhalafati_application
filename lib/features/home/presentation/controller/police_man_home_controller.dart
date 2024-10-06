import '/config/all_imports.dart';

class PoliceManHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController pageController;
  late TooltipBehavior tooltipBehavior;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String totalViolations = '999';
  String policeName = 'خالد شبير';
  String policeImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';
  String policeFirstName = 'خالد';
  String welcome = ManagerStrings.goodMorning;
  String highestViolationsInMonth = 'يناير';
  String highestViolationsInWeek = ManagerStrings.saturday;
  int currentPage = 0;
  bool isSelectedButtonWeeklyViolations = true;
  bool isSelectedButtonMonthlyViolations = false;

  @override
  void onInit() {
    super.onInit();
    changeWelcome();
    pageController = PageController();
    tooltipBehavior = TooltipBehavior(enable: true);
    s();
  }

  void changeWelcome() {
    if (DateTime.now().hour >= 12) {
      welcome = ManagerStrings.goodEvening;
    } else {
      welcome = ManagerStrings.goodMorning;
    }
    update();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void buttonWeeklyViolations() {
    if (currentPage == 1) {
      isSelectedButtonMonthlyViolations = false;
      isSelectedButtonWeeklyViolations = true;
      s();
      pageController.previousPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
    update();
  }

  void buttonMonthlyViolations() {
    if (currentPage == 0) {
      isSelectedButtonMonthlyViolations = true;
      isSelectedButtonWeeklyViolations = false;
      s();
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
    update();
  }

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  void s() {
    // for (int x = 0; x < monthlyViolations.length; x++) {
    //   totalViolations =
    //       '${monthlyViolations[x].y + monthlyViolations[x + 1].y}';
    // }
  }

  List weeklyViolations = <BarChartData>[
    BarChartData(ManagerStrings.saturday, 10),
    BarChartData(ManagerStrings.sunday, 20),
    BarChartData(ManagerStrings.monday, 30),
    BarChartData(ManagerStrings.tuesday, 40),
    BarChartData(ManagerStrings.wednesday, 50),
    BarChartData(ManagerStrings.thursday, 50),
  ];

  List monthlyViolations = <BarChartData>[
    BarChartData(AppConstants.one, 10),
    BarChartData(AppConstants.two, 20),
    BarChartData(AppConstants.three, 30),
    BarChartData(AppConstants.four, 40),
    BarChartData(AppConstants.five, 50),
    BarChartData(AppConstants.sex, 60),
    BarChartData(AppConstants.seven, 70),
    BarChartData(AppConstants.eight, 80),
    BarChartData(AppConstants.nine, 90),
    BarChartData(AppConstants.three, 100),
    BarChartData(AppConstants.eleven, 110),
    BarChartData(AppConstants.twelve, 120),
  ];

//////////////////////////
// void image(int? noteId) async {
//   final picker = ImagePicker();
//   final imageFile = await picker.pickImage(
//     source: ImageSource.camera,
//     maxHeight: 600,
//   );
//   if (imageFile != null) {
//     _file = File(imageFile.path);
//   }
//   Directory directory = await getApplicationDocumentsDirectory();
//   final fileName = path.basename(imageFile!.path);
//   _saveImage = await _file!.copy('${directory.path}/$fileName');
//   _save(noteId);
// }

//   void returnImage(int noteId) => _imagesNote.value = _allImagesNotes.where((image) => image.noteId == noteId).toList();
}
