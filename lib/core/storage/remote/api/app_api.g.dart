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
  Future<SendComplaintResponse> sendComplaint(
    dynamic complaintsName,
    dynamic addressOfComplaint,
    dynamic detailOfComplaint,
    dynamic dateOfIncidentOrProblem,
    dynamic state,
    dynamic driverId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'complaints_name': complaintsName,
      'address_of_complaint': addressOfComplaint,
      'detail_of_complaint': detailOfComplaint,
      'date_of_incident_or_problem': dateOfIncidentOrProblem,
      'state': state,
      'driver_id': driverId,
    };
    final _options = _setStreamType<SendComplaintResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://zcknvmsialjyofywmiac.supabase.co/rest/v1/rpc/send_complaint',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SendComplaintResponse _value;
    try {
      _value = SendComplaintResponse.fromJson(_result.data!);
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
