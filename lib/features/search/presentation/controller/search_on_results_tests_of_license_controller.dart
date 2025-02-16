import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseController extends GetxController
    with CustomToast {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _useCase = instance<SearchOnResultsTestsOfLicenseUseCase>();

  late TextEditingController _idNumber;

  String _resultName = '';
  late FocusNode _focusNode;

  bool _licenseTestResults = false;

  bool _practicalTestResult = false;
  String _savedSearchIdNumber = '';

  bool _loading = false;
  bool _result = false;

  bool get loading => _loading;

  bool get result => _result;

  bool get licenseTestResults => _licenseTestResults;

  bool get practicalTestResult => _practicalTestResult;

  String get resultName => _resultName;

  String get savedSearchIdNumber => _savedSearchIdNumber;

  TextEditingController get idNumber => _idNumber;

  FocusNode get focusNode => _focusNode;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onInit() {
    super.onInit();
    _idNumber = TextEditingController() ..addListener(
          () {
        selectCursorPosition(_idNumber);
      },
    );
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _idNumber.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer(BuildContext context) {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      // _focusNode.unfocus();
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void searchButton(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_idNumber.text.isNotEmpty && _idNumber.text != _savedSearchIdNumber) {
      if (_idNumber.text.length == AppConstants.maxLengthOfIDNumber) {
        _loading = true;
        _result = false;
        update();
        (await _useCase.execute(
          SearchOnResultsTestsOfLicenseUseCaseInput(idNumber: _idNumber.text),
        ))
            .fold(
          /// Failed request search on results tests of license
          (l) {
            /// Appear message of error in SnackBar to user
            _result = false;
            _idNumber.clear();
            showToast(message: l.message, context: context);
          },

          /// Successfully request search on results tests of license
          (r) {
            _savedSearchIdNumber = _idNumber.text;
            _resultName = r.studentName;
            _practicalTestResult = r.practicalTestResult;
            _licenseTestResults = r.licenseTestResults;
            _result = true;
          },
        );
      } else {
        /// Appear message of error in SnackBar to user
        showToast(message: ManagerStrings.idNumberUnAccept, context: context);
      }
    } else {
      /// Appear message of error in SnackBar to user
      showToast(message: ManagerStrings.pleaseEnterIdNumber, context: context);
    }
    _loading = false;
    update();
  }
}
