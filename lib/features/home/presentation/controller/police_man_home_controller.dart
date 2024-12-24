import '/config/all_imports.dart';

class PoliceManHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController pageController;
  late TooltipBehavior tooltipBehavior;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late String policeFirstName;
  int currentPage = 0;

  late String totalViolations;
  late String policeImage;

  String welcome = ManagerStrings.goodMorning;

  String highestViolationsInMonth = 'يناير';
  String highestViolationsInWeek = ManagerStrings.saturday;

  bool isSelectedButtonWeeklyViolations = true;
  bool isSelectedButtonMonthlyViolations = false;

  @override
  void onInit() async {
    super.onInit();
    getTotalViolationsFromDatabase();

    policeImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);

    policeFirstName =
        SharedPreferencesController.getString(SharedPreferencesKeys.firstName);
    changeWelcome();

    pageController = PageController();
    tooltipBehavior = TooltipBehavior(enable: true);
    s();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void getTotalViolationsFromDatabase() {
    // totalViolations = _violationsDatabase
    //     .totalViolationsOfPolice(_sharedPreferences.getUserId())
    //     .toString();
  }

  /// Change the hello word based on time [goodEvening] and [goodMorning]
  void changeWelcome() {
    if (DateTime.now().hour >= 12) {
      welcome = ManagerStrings.goodEvening;
    } else {
      welcome = ManagerStrings.goodMorning;
    }
    update();
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
