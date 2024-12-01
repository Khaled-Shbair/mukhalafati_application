import '/config/all_imports.dart';

class ListOfViolationsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final ListOfReasonsOfViolationsUseCase _listOfReasonsOfViolationsUseCase =
      instance<ListOfReasonsOfViolationsUseCase>();
  final ReasonOfViolationUseCase _reasonsOfViolationsUseCase =
      instance<ReasonOfViolationUseCase>();

  late String policeName;

  late String policeImage;
  bool loading = false;

  List<ViolationModel> data = <ViolationModel>[];
  List<ReasonOfViolationModel> reasonsViolations = <ReasonOfViolationModel>[];

  @override
  void onInit() {
    super.onInit();
    _getReasonsOfViolations();
    policeName =
        '${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}';
    policeImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);
  }

  void _getReasonsOfViolations() async {
    loading = true;
    (await _listOfReasonsOfViolationsUseCase.execute()).fold(
      (l) {},
      (r) {
        reasonsViolations = r.data;
      },
    );
    loading = false;
    update();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void getViolationsOfPolice() async {
    loading = true;
    // data = await _violationsDatabase.read();
    loading = false;
    update();
  }
}
