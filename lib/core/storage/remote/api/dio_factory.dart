import 'package:dio/dio.dart';

import '/config/all_imports.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: _headers,
      sendTimeout: const Duration(seconds: ApiConstants.sendTimeoutSeconds),
      receiveTimeout:
          const Duration(seconds: ApiConstants.receiveTimeoutSeconds),
    );
    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.baseUrl = ApiConstants.baseUrl;
        options.headers = _headers;
        return handler.next(options);
      },
    );
    dio.interceptors.add(interceptorsWrapper);
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );
    }

    return dio;
  }

  Map<String, dynamic> get _headers => {
        ApiKeys.authorization: '${ApiConstants.bearer} ${ApiConstants.apikey}',
        ApiKeys.apikey: ApiConstants.apikey,
        ApiKeys.contentType: ApiConstants.applicationJson,
      };
}
