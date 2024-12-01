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

  late String policeName;
  late String policeImage;

  @override
  void onInit() {
    super.onInit();
    policeName =
    '${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}';
    policeImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);
    licenseNumberController = TextEditingController();
  }

  @override
  void onClose() {
    licenseNumberController.dispose();
    super.onClose();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void searchButton() async {
    loading = true;
    update();
    if (_checkData()) {
      (await _searchForDriverUseCase.execute(
        SearchForDriverInput(licenseNumber: licenseNumberController.text),
      ))
          .fold(
        (l) {
          showSnackBar(message: l.message);
        },
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
      showSnackBar(message: ManagerStrings.pleaseEnterLicenseNumber);
    }
    loading = false;
    update();
  }

  bool _checkData() {
    if (licenseNumberController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
