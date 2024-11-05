import 'package:dio/dio.dart';

import '/config/all_imports.dart';

class Failure {
  int code;
  String message;

  Failure({
    required this.code,
    required this.message,
  });
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = Failure(
        code: error.response?.statusCode ?? ResponseCode.BAD_REQUEST.value,
        message:
            error.response?.data[ApiKeys.message] ?? ManagerStrings.badRequest,
      );
    } else {
      failure = Failure(
        code: ResponseCode.BAD_REQUEST.value,
        message: ManagerStrings.badRequest,
      );
    }
  }
}
