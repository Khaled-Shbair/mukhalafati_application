import '/config/all_imports.dart';

class SearchForDriverController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SearchForDriverUseCase _searchForDriverUseCase =
      instance<SearchForDriverUseCase>();

  late TextEditingController licenseNumberController;
  bool loading = false;
  bool result = false;
  late String licenseNumber;

  late String expiryDate;
  late String releaseDate;

  late String idNumber;
  late String nameAr;
  late String nameEn;

  late String licenseLevels;

  late String imageDriver;

  late int numberOfViolations;

  @override
  void onInit() {
    super.onInit();
    licenseNumberController = TextEditingController();
  }

  @override
  void onClose() {
    licenseNumberController.dispose();
    super.onClose();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void searchButton(BuildContext context) async {
    loading = true;
    update();
    if (_checkData()) {
      (await _searchForDriverUseCase.execute(
        SearchForDriverInput(licenseNumber: licenseNumberController.text),
      ))

          /// Failed request search for driver
          .fold(
        (l) {
          /// Appear message of error in SnackBar to user
          showSnackBar(message: l.message, context: context);
        },

        /// Successfully request search for driver
        (r) {
          licenseNumber = r.licenseNumber;
          expiryDate = r.expiryDate;
          releaseDate = r.releaseDate;
          idNumber = r.idNumber;
          nameAr = r.nameAr;
          nameEn = r.nameEn;
          licenseLevels = r.licenseLevels;
          imageDriver = r.imageDriver;
          numberOfViolations = r.numberOfViolations;
          result = true;
        },
      );
    } else {
      /// Appear message of error in SnackBar to user
      showSnackBar(
          message: ManagerStrings.pleaseEnterLicenseNumber, context: context);
    }
    loading = false;
    update();
  }

  /// check inputs user data in not empty
  bool _checkData() {
    if (licenseNumberController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
