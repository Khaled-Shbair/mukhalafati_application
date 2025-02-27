import '/config/all_imports.dart';

class SearchForDriverController extends GetxController with CustomToast {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchForDriverUseCase = instance<SearchForDriverUseCase>();

  late TextEditingController _licenseNumberController;

  late FocusNode _focusNode;

  bool _loading = false;
  bool _result = false;
  String _savedSearchLicenseNumber = '';

  String _licenseNumber = '';
  String _expiryDate = '';
  String _releaseDate = '';
  String _idNumber = '';
  String _nameAr = '';
  String _nameEn = '';
  String _licenseLevels = '';
  String _imageDriver = '';
  int _numberOfViolations = 1;

  bool get loading => _loading;

  bool get result => _result;

  int get numberOfViolations => _numberOfViolations;

  FocusNode get focusNode => _focusNode;

  String get licenseNumber => _licenseNumber;

  String get expiryDate => _expiryDate;

  String get releaseDate => _releaseDate;

  String get idNumber => _idNumber;

  String get nameAr => _nameAr;

  String get nameEn => _nameEn;

  String get licenseLevels => _licenseLevels;

  String get imageDriver => _imageDriver;

  TextEditingController get licenseNumberController => _licenseNumberController;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onInit() {
    super.onInit();

    _licenseNumberController = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_licenseNumberController);
        },
      );
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _licenseNumberController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer(BuildContext context) {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
      _focusNode.unfocus();
    }
  }

  void searchButton(BuildContext context) async {
    _focusNode.unfocus();
    if (_licenseNumberController.text.isNotEmpty &&
        _licenseNumberController.text != _savedSearchLicenseNumber) {
      if (_licenseNumberController.text.length ==
          AppConstants.maxLengthOfLicenseNumber) {
        _loading = true;
        _result = false;
        update();
        (await _searchForDriverUseCase.execute(
          SearchForDriverInput(licenseNumber: _licenseNumberController.text),
        ))

            /// Failed request search for driver
            .fold(
          (l) {
            _result = false;
            _licenseNumberController.clear();

            /// Appear message of error in SnackBar to user
            showToast(message: l.message, context: context);
          },

          /// Successfully request search for driver
          (r) {
            _savedSearchLicenseNumber = r.licenseNumber;
            _licenseNumber = r.licenseNumber;
            _expiryDate = r.expiryDate;
            _releaseDate = r.releaseDate;
            _idNumber = r.idNumber;
            _nameAr = r.nameAr;
            _nameEn = r.nameEn;
            _licenseLevels = r.licenseLevels;
            _imageDriver = r.imageDriver;
            _numberOfViolations = r.numberOfViolations;
            _result = true;
          },
        );
      } else {
        showToast(
            message: ManagerStrings.licenseNumberUnAccept, context: context);
      }
    } else {
      /// Appear message of error in SnackBar to user
      showToast(
          message: ManagerStrings.pleaseEnterLicenseNumber, context: context);
    }
    _loading = false;
    update();
  }
}
