// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _AppApi implements AppApi {
  _AppApi(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://zcknvmsialjyofywmiac.supabase.co';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<DriverLoginResponse> driverLogin(
    dynamic licenseNumber,
    dynamic password,
    dynamic language,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'input_license_number': licenseNumber,
      'input_password': password,
      'language': language,
    };
    final _options = _setStreamType<DriverLoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/driver_login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DriverLoginResponse _value;
    try {
      _value = DriverLoginResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<PoliceManLoginResponse> policeManLogin(
    dynamic jobNumber,
    dynamic password,
    dynamic language,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'input_job_number': jobNumber,
      'input_password': password,
      'language': language,
    };
    final _options = _setStreamType<PoliceManLoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/police_man_login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PoliceManLoginResponse _value;
    try {
      _value = PoliceManLoginResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<CreateComplaintResponse> createComplaint(
    dynamic complaintsName,
    dynamic addressOfComplaint,
    dynamic detailOfComplaint,
    dynamic dateOfIncidentOrProblem,
    dynamic status,
    dynamic driverId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'complainants_name': complaintsName,
      'address': addressOfComplaint,
      'detail_of_complaint': detailOfComplaint,
      'date_of_incident_or_problem': dateOfIncidentOrProblem,
      'status': status,
      'driver_id': driverId,
    };
    final _options = _setStreamType<CreateComplaintResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/create_complaint',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CreateComplaintResponse _value;
    try {
      _value = CreateComplaintResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DriverForgotPasswordResponse> forgetPasswordDriver(
    dynamic licenseNumber,
    dynamic language,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'input_license_number': licenseNumber,
      'language': language,
    };
    final _options = _setStreamType<DriverForgotPasswordResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/forget_password_driver',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DriverForgotPasswordResponse _value;
    try {
      _value = DriverForgotPasswordResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<PoliceManForgotPasswordResponse> forgetPasswordPoliceMan(
    dynamic jobNumber,
    dynamic language,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'input_job_number': jobNumber,
      'language': language,
    };
    final _options = _setStreamType<PoliceManForgotPasswordResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/forget_password_police_man',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PoliceManForgotPasswordResponse _value;
    try {
      _value = PoliceManForgotPasswordResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DriverChangePasswordResponse> changePasswordDriver(
    dynamic driverId,
    dynamic newPassword,
    dynamic confirmPassword,
    dynamic language,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'driver_id': driverId,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
      'language': language,
    };
    final _options = _setStreamType<DriverChangePasswordResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/driver_change_password',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DriverChangePasswordResponse _value;
    try {
      _value = DriverChangePasswordResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<PoliceManChangePasswordResponse> changePasswordPoliceMan(
    dynamic policeManId,
    dynamic newPassword,
    dynamic confirmPassword,
    dynamic language,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'police_man_id': policeManId,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
      'language': language,
    };
    final _options = _setStreamType<PoliceManChangePasswordResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/police_man_change_password',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PoliceManChangePasswordResponse _value;
    try {
      _value = PoliceManChangePasswordResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetAllComplaintsForDriverResponse> getAllComplaintsForDriver(
      dynamic driverId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'driver_id': driverId};
    final _options = _setStreamType<GetAllComplaintsForDriverResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/get_all_complaints_for_driver',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetAllComplaintsForDriverResponse _value;
    try {
      _value = GetAllComplaintsForDriverResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SearchForDriverResponse> searchForDriver(dynamic licenseNumber) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'license_number': licenseNumber};
    final _options = _setStreamType<SearchForDriverResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/search_for_driver',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SearchForDriverResponse _value;
    try {
      _value = SearchForDriverResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SearchOnResultsTestsOfLicenseResponse> searchOnResultsTestsOfLicense(
      dynamic idNumber) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'id_number': idNumber};
    final _options =
        _setStreamType<SearchOnResultsTestsOfLicenseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/search_on_results_tests_of_license',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SearchOnResultsTestsOfLicenseResponse _value;
    try {
      _value = SearchOnResultsTestsOfLicenseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<CreateViolationResponse> createViolation(
    dynamic priceOfViolation,
    dynamic violationReason,
    dynamic violationDate,
    dynamic violationTime,
    dynamic violationAddress,
    dynamic driverIdNumber,
    dynamic policeManId,
    dynamic driverName,
    dynamic ownerName,
    dynamic ownerId,
    dynamic vehicleNumber,
    dynamic vehicleType,
    dynamic vehicleColor,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'price_of_violation': priceOfViolation,
      'violation_reason': violationReason,
      'violation_date': violationDate,
      'violation_time': violationTime,
      'violation_address': violationAddress,
      'driver_id_number': driverIdNumber,
      'police_man_id': policeManId,
      'driver_name': driverName,
      'owner_name': ownerName,
      'owner_id': ownerId,
      'vehicle_number': vehicleNumber,
      'vehicle_type': vehicleType,
      'vehicle_color': vehicleColor,
    };
    final _options = _setStreamType<CreateViolationResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/create_violation',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CreateViolationResponse _value;
    try {
      _value = CreateViolationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ListOfReasonsOfViolationsResponse> listOfReasonsOfViolations() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ListOfReasonsOfViolationsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/list_of_reasons_of_violations',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListOfReasonsOfViolationsResponse _value;
    try {
      _value = ListOfReasonsOfViolationsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ReasonOfViolationResponse> reasonOfViolation(dynamic id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'input_id': id};
    final _options = _setStreamType<ReasonOfViolationResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/reason_of_violation',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ReasonOfViolationResponse _value;
    try {
      _value = ReasonOfViolationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<PaymentViolationResponse> paymentViolation(
    dynamic violationId,
    dynamic paymentDateAndTime,
    dynamic violationState,
    dynamic violationPayedBy,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'violation_id': violationId,
      'payment_date_and_time': paymentDateAndTime,
      'violation_state': violationState,
      'violation_payed_by': violationPayedBy,
    };
    final _options = _setStreamType<PaymentViolationResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/payment_violation',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PaymentViolationResponse _value;
    try {
      _value = PaymentViolationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DriverViolationsResponse> getViolationsByDriver(
      dynamic driverId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'driver_id': driverId};
    final _options = _setStreamType<DriverViolationsResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/get_driver_violations',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DriverViolationsResponse _value;
    try {
      _value = DriverViolationsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
