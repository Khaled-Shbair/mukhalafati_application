import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/config/all_imports.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST(ApiConstants.driverLogin)
  Future<DriverLoginResponse> driverLogin(
      @Field(ApiKeys.inputLicenseNumber) licenseNumber,
      @Field(ApiKeys.inputPassword) password,
      @Field(ApiKeys.language) language);

  @POST(ApiConstants.policeManLogin)
  Future<PoliceManLoginResponse> policeManLogin(
      @Field(ApiKeys.inputJobNumber) jobNumber,
      @Field(ApiKeys.inputPassword) password,
      @Field(ApiKeys.language) language);

  @POST(ApiConstants.sendComplaint)
  Future<SendComplaintResponse> sendComplaint(
    @Field(ApiKeys.complaintsName) complaintsName,
    @Field(ApiKeys.addressOfComplaint) addressOfComplaint,
    @Field(ApiKeys.detailOfComplaint) detailOfComplaint,
    @Field(ApiKeys.dateOfIncidentOrProblem) dateOfIncidentOrProblem,
    @Field(ApiKeys.state) state,
    @Field(ApiKeys.driverId) driverId,
  );

  @POST(ApiConstants.forgetPasswordDriver)
  Future<DriverForgotPasswordResponse> forgetPasswordDriver(
    @Field(ApiKeys.inputLicenseNumber) licenseNumber,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.forgetPasswordPoliceMan)
  Future<PoliceManForgotPasswordResponse> forgetPasswordPoliceMan(
    @Field(ApiKeys.inputJobNumber) jobNumber,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.changePasswordDriver)
  Future<DriverChangePasswordResponse> changePasswordDriver(
    @Field(ApiKeys.driverId) driverId,
    @Field(ApiKeys.newPassword) newPassword,
    @Field(ApiKeys.confirmPassword) confirmPassword,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.changePasswordPoliceMan)
  Future<PoliceManChangePasswordResponse> changePasswordPoliceMan(
    @Field(ApiKeys.policeManId) policeManId,
    @Field(ApiKeys.newPassword) newPassword,
    @Field(ApiKeys.confirmPassword) confirmPassword,
    @Field(ApiKeys.language) language,
  );
}
