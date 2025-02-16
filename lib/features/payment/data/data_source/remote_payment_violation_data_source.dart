import '/config/all_imports.dart';

abstract class RemotePaymentViolationDataSource {
  Future<PaymentViolationResponse> paymentViolation(
      PaymentViolationRequest request);
}

class RemotePaymentViolationDataSourceImpl
    extends RemotePaymentViolationDataSource {
  final AppApi _appApi;

  RemotePaymentViolationDataSourceImpl(this._appApi);

  @override
  Future<PaymentViolationResponse> paymentViolation(
      PaymentViolationRequest request) async {
    return await _appApi.paymentViolation(
      request.violationId,
      request.paymentDateAndTime,
      request.violationState,
      request.violationPayedBy,

    );
  }
}
