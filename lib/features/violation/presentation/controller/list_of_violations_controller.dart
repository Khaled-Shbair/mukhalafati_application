import '/config/all_imports.dart';

class ListOfViolationsController extends GetxController with CustomToast {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final _allViolationUseCase = instance<AllViolationUseCase>();
  final _getViolationDetailsUseCase = instance<GetViolationDetailsUseCase>();
  final _sharedPreferences = instance<SharedPreferencesController>();
  int _currentPage = 1;
  final List<ViolationModel> _allViolations = [];
  List<ViolationModel> _displayedViolations = [];

  final List<String> _allRegion = [];
  final List<String> _allDate = [
    ManagerStrings.january,
    ManagerStrings.february,
    ManagerStrings.march,
    ManagerStrings.april,
    ManagerStrings.may,
    ManagerStrings.june,
    ManagerStrings.july,
    ManagerStrings.august,
    ManagerStrings.september,
    ManagerStrings.october,
    ManagerStrings.november,
    ManagerStrings.december,
  ];

  bool _loading = false;
  String? _selectRegion;
  String? _selectDate;
  bool _completeGetAllViolationFormDatabase = false;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool get loading => _loading;

  String? get selectRegion => _selectRegion;

  String? get selectDate => _selectDate;

  List<ViolationModel> get displayedViolations => _displayedViolations;

  List<String> get allRegion => _allRegion;

  List<String> get allDate => _allDate;


  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent &&
            _completeGetAllViolationFormDatabase == false) {
          _getMoreViolations();
        }
      });
    });
    getViolationsOfPolice();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void changeRegion(String? region) {
    if (region != null) {
      _selectRegion = region;
      _displayedViolations = _allViolations
          .where((e) => e.violationAddress.contains(_selectRegion!))
          .toList();
      update();
    }
  }

  String _convertMonthFormNameToNumber(String? month) {
    if (month == ManagerStrings.january) {
      return '1';
    } else if (month == ManagerStrings.february) {
      return '2';
    } else if (month == ManagerStrings.march) {
      return '3';
    } else if (month == ManagerStrings.april) {
      return '4';
    } else if (month == ManagerStrings.may) {
      return '5';
    } else if (month == ManagerStrings.june) {
      return '6';
    } else if (month == ManagerStrings.july) {
      return '7';
    } else if (month == ManagerStrings.august) {
      return '8';
    } else if (month == ManagerStrings.september) {
      return '9';
    } else if (month == ManagerStrings.october) {
      return '10';
    } else if (month == ManagerStrings.november) {
      return '11';
    } else if (month == ManagerStrings.december) {
      return '12';
    } else {
      return '';
    }
  }

  String _getMonthFormDate(String date) {
    if (date.isNotEmpty) {
      List<String> result = date.split('/');
      return result[0];
    } else {
      return '';
    }
  }

  void changeDate(String? date) {
    if (date != null) {
      _selectDate = date;
      _displayedViolations = _allViolations
          .where((e) =>
              _getMonthFormDate(e.violationDate) ==
              (_convertMonthFormNameToNumber(_selectDate)))
          .toList();
      update();
    }
  }

  Future<void> _getMoreViolations() async {
    _currentPage++;
    await getViolationsOfPolice();
  }

  Future<void> getViolationsOfPolice() async {
    // First, appear loading until data comes from Api
    _loading = true;
    // send request to get data from api
    (await _allViolationUseCase.execute(
      AllViolationUseCaseInput(
        limit: 20,
        page: _currentPage,
      ),
    ))
        .fold(
      (l) {
        /// Appear message of error in SnackBar to user
        showToast(message: l.message, context: Get.context!);
      },
      (r) {
        // to avoid send request and load on server when get all data
        if (r.data.isEmpty) {
          _completeGetAllViolationFormDatabase = true;
        }
        // save coming data in list [data]
        _allViolations.addAll(r.data);
        _displayedViolations = _allViolations;
        _addRegion();
      },
    );
    // Hide loading and appear data
    _loading = false;
    update();
  }

  //Save areas according to previously recorded violations
  void _addRegion() {
    for (var e in _allViolations) {
      List<String> result = e.violationAddress.split(' ');
      String region = result.first;
      _allRegion.addIf(!_allRegion.contains(region), region);
    }
  }

  void onTapOnViolationToViewDetails(
      BuildContext context, int violationId) async {
    (await _getViolationDetailsUseCase
            .execute(GetViolationDetailsUseCaseInput(violationId: violationId)))
        .fold(
      (l) {
        /// Appear message of error in SnackBar to user
        showToast(message: l.message, context: context);
      },
      (r) {
        showDialog(
          context: context,
          barrierColor: ManagerColors.black50,
          barrierDismissible: false,
          builder: (context) {
            return CustomViolationDetails(
              closeButton: () => context.pop(),
              date: r.violationDate,
              dateNow: FormatDateAndTimeHelper.dateNow,
              driverIdNumber: r.driverIdNumber,
              driverName: r.driverName,
              ownerIdNumber: r.ownerIdNumber,
              ownerName: r.ownerName,
              vehicleColor: r.vehicleColor,
              vehicleNumber: r.vehicleNumber,
              vehicleType: r.vehicleType,
              notificationEditorName:
                  'ال${_sharedPreferences.getString(SharedPreferencesKeys.policeMilitaryRank)} ${FormatNameHelper.firstNameAndLastNameAr(_sharedPreferences.getString(SharedPreferencesKeys.nameAr))}',
              numberOfViolation: r.id.toString(),
              placeOfViolation: r.violationAddress,
              timeOfViolation: r.violationTime,
              reasonForViolation: r.violationReason,
            );
          },
        );
      },
    );
  }
}
