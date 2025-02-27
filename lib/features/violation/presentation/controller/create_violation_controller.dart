import 'dart:async';

import '/config/all_imports.dart';

class CreateViolationController extends GetxController with CustomToast {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _reasonsOfViolationUseCase = instance<AllReasonOfViolationUseCase>();
  final _fbNotifications = instance<FbNotifications>();
  final _createViolationUseCase = instance<CreateViolationUseCase>();
  final _saveNotificationUseCase = instance<SaveNotificationUseCase>();
  bool _loading = false;

  String? _reasonOfViolation;
  late int _reasonOfViolationId;
  List<ReasonOfViolationModel> _allReasons = [];

  late TextEditingController _driverName;
  late TextEditingController _driverIdNumber;
  late TextEditingController _ownerName;
  late TextEditingController _ownerId;
  late TextEditingController _vehicleNumber;
  late TextEditingController _vehicleType;
  late TextEditingController _vehicleColor;
  late TextEditingController _violationTime;
  late TextEditingController _violationDate;
  late TextEditingController _placeOfViolation;
  late TextEditingController _searchForViolation;

  TextEditingController get driverName => _driverName;

  TextEditingController get driverIdNumber => _driverIdNumber;

  TextEditingController get ownerName => _ownerName;

  TextEditingController get ownerId => _ownerId;

  TextEditingController get vehicleNumber => _vehicleNumber;

  TextEditingController get vehicleType => _vehicleType;

  TextEditingController get vehicleColor => _vehicleColor;

  TextEditingController get violationTime => _violationTime;

  TextEditingController get violationDate => _violationDate;

  TextEditingController get placeOfViolation => _placeOfViolation;

  TextEditingController get searchForViolation => _searchForViolation;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  GlobalKey<FormState> get formKey => _formKey;

  bool get loading => _loading;

  String? get reasonOfViolation => _reasonOfViolation;

  List<ReasonOfViolationModel> get allReasons => _allReasons;

  @override
  void onInit() {
    super.onInit();
    _getReasonsOfViolations();
    _driverName = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_driverName);
        },
      );
    _driverIdNumber = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_driverIdNumber);
        },
      );
    _ownerName = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_ownerName);
        },
      );
    _ownerId = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_ownerId);
        },
      );
    _vehicleNumber = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_vehicleNumber);
        },
      );
    _vehicleType = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_vehicleType);
        },
      );
    _vehicleColor = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_vehicleColor);
        },
      );
    _violationTime =
        TextEditingController(text: FormatDateAndTimeHelper.timeNow);
    _violationDate =
        TextEditingController(text: FormatDateAndTimeHelper.dateNow);
    _placeOfViolation = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_placeOfViolation);
        },
      );
    _searchForViolation = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_searchForViolation);
        },
      );
  }

  @override
  void onClose() {
    _driverName.dispose();
    _driverIdNumber.dispose();
    _ownerName.dispose();
    _ownerId.dispose();
    _vehicleNumber.dispose();
    _vehicleType.dispose();
    _vehicleColor.dispose();
    _violationTime.dispose();
    _violationDate.dispose();
    _placeOfViolation.dispose();
    _searchForViolation.dispose();
    super.onClose();
  }

  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void changeReasonOfViolation(String? reason) {
    if (reason != null) {
      _reasonOfViolation = reason;
      _selectPriceOfViolation();
      update();
    }
  }

  void _selectPriceOfViolation() {
    for (var e in _allReasons) {
      if (e.reason == _reasonOfViolation) {
        _reasonOfViolationId = e.id;
      }
    }
  }

  Future<void> _getReasonsOfViolations() async {
    _loading = true;
    (await _reasonsOfViolationUseCase.execute()).fold(
      (l) {},
      (r) {
        _allReasons = r.data;
      },
    );
    _loading = false;
    update();
  }

  void createViolation(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await customConfirmInformationDialog(
        context: context,
        confirmButton: () async {
          context.pop();
          customLoading(context);
          (await _createViolationUseCase.execute(_violationDataInput())).fold(
            (l) {
              context.pop();
              showToast(message: l.message, context: context);
            },
            (r) async {
              context.pop();
              if (r.fcmToken != null || r.fcmToken.isNotEmpty) {
                _sendNotification(r.fcmToken);
                _saveNotification(r.driverId);
              }
              _showSuccessfullyDialog(context);
            },
          );
        },
        title: ManagerStrings.theViolationWasSuccessfullyCreated,
        closeButton: () {
          context.pushNamedAndRemoveAllUntil(Routes.policeManHomeScreen);
          disposeCreateViolation();
        },
      );
    }
  }

  void _sendNotification(String fcmToken) async {
    await _fbNotifications.sendNotification(
      fcmToken: fcmToken,
      title: ManagerStrings.violationHasBeenRegistered,
      body: _reasonOfViolation.onNull(),
      data: {
        ApiKeys.route: Routes.violationPaymentScreen,
      },
    );
  }

  void _saveNotification(int driverId) async {
    await _saveNotificationUseCase.execute(
      SaveNotificationUseCaseInput(
        driverId: driverId,
        title: ManagerStrings.violationHasBeenRegistered,
        content: _reasonOfViolation.onNull(),
        dateSend: FormatDateAndTimeHelper.dateNow,
        timeSend: FormatDateAndTimeHelper.timeNow,
      ),
    );
  }

  void _showSuccessfullyDialog(BuildContext context) async {
    await customCreatedSuccessfullyDialog(
      context: context,
      closeButton: () {
        if (context.mounted) {
          context.pushNamedAndRemoveAllUntil(Routes.policeManHomeScreen);
          disposeCreateViolation();
        }
      },
      text: ManagerStrings.theViolationWasSuccessfullyCreated,
    );
  }

  CreateViolationUseCaseInput _violationDataInput() {
    return CreateViolationUseCaseInput(
      reasonOfViolationId: _reasonOfViolationId,
      driverIdNumber: _driverIdNumber.text,
      driverName: _driverName.text,
      ownerName: _ownerName.text,
      ownerIdNumber: _ownerId.text,
      violationAddress: _placeOfViolation.text,
      vehicleColor: _vehicleColor.text,
      vehicleNumber: _vehicleNumber.text,
      violationDate: _violationDate.text,
      vehicleType: _vehicleType.text,
      violationTime: _violationTime.text,
    );
  }
}
