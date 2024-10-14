import '/config/all_imports.dart';

class ListOfViolationsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ViolationsDatabaseController _violationsDatabase =
      instance<ViolationsDatabaseController>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late String policeName;

  late String policeImage;
  bool loading = false;

  List<ViolationModel> data = <ViolationModel>[];

  @override
  void onInit() {
    super.onInit();
    policeName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    policeImage = _sharedPreferences.getImage();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void getViolationsOfPolice() async {
    loading = true;
    data = await _violationsDatabase.read();
    loading = false;
    update();
  }
}
