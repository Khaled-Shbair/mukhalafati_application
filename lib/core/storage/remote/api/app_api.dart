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

  @POST(ApiConstants.createComplaint)
  Future<CreateComplaintResponse> createComplaint(
    @Field(ApiKeys.complaintsName) complaintsName,
    @Field(ApiKeys.address) addressOfComplaint,
    @Field(ApiKeys.detailOfComplaint) detailOfComplaint,
    @Field(ApiKeys.dateOfIncidentOrProblem) dateOfIncidentOrProblem,
    @Field(ApiKeys.status) status,
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

  @POST(ApiConstants.getAllComplaintsForDriver)
  Future<GetAllComplaintsForDriverResponse> getAllComplaintsForDriver(
    @Field(ApiKeys.driverId) driverId,
  );

  @POST(ApiConstants.searchForDriver)
  Future<SearchForDriverResponse> searchForDriver(
    @Field(ApiKeys.licenseNumber) licenseNumber,
  );

  @POST(ApiConstants.searchOnResultsTestsOfLicense)
  Future<SearchOnResultsTestsOfLicenseResponse> searchOnResultsTestsOfLicense(
    @Field(ApiKeys.idNumber) idNumber,
  );

  @POST(ApiConstants.createViolation)
  Future<CreateViolationResponse> createViolation(
    @Field(ApiKeys.priceOfViolation) priceOfViolation,
    @Field(ApiKeys.violationReason) violationReason,
    @Field(ApiKeys.violationDate) violationDate,
    @Field(ApiKeys.violationTime) violationTime,
    @Field(ApiKeys.violationAddress) violationAddress,
    @Field(ApiKeys.driverIdNumber) driverIdNumber,
    @Field(ApiKeys.policeManId) policeManId,
    @Field(ApiKeys.driverName) driverName,
    @Field(ApiKeys.ownerName) ownerName,
    @Field(ApiKeys.ownerId) ownerId,
    @Field(ApiKeys.vehicleNumber) vehicleNumber,
    @Field(ApiKeys.vehicleType) vehicleType,
    @Field(ApiKeys.vehicleColor) vehicleColor,
  );

  @GET(ApiConstants.listOfReasonsOfViolations)
  Future<ListOfReasonsOfViolationsResponse> listOfReasonsOfViolations();

  @POST(ApiConstants.reasonOfViolation)
  Future<ReasonOfViolationResponse> reasonOfViolation(
    @Field(ApiKeys.inputId) id,
  );

  @POST(ApiConstants.paymentViolation)
  Future<PaymentViolationResponse> paymentViolation(
    @Field(ApiKeys.violationId) violationId,
    @Field(ApiKeys.paymentDateAndTime) paymentDateAndTime,
    @Field(ApiKeys.violationState) violationState,
    @Field(ApiKeys.violationPayedBy) violationPayedBy,
  );

  @POST(ApiConstants.getDriverViolations)
  Future<DriverViolationsResponse> getViolationsByDriver(
    @Field(ApiKeys.driverId) driverId,
  );

  @POST(ApiConstants.getListOfViolationsForPolice)
  Future<ListOfViolationsForPoliceResponse> getListOfViolationsForPolice(
    @Field(ApiKeys.policeManId) policeManId,
  );

  @POST(ApiConstants.sendVerificationCode)
  Future<SendVerificationCodeResponse> sendVerificationCode(
    @Field(ApiKeys.phoneNumber) phoneNumber,
  );

  @POST(ApiConstants.sendRequestUpdateProfile)
  Future<SendRequestUpdateProfileResponse> sendRequestUpdateProfile(
    @Field(ApiKeys.driverId) driverId,
    @Field(ApiKeys.name) name,
    @Field(ApiKeys.idNumber) idNumber,
    @Field(ApiKeys.licenseNumber) licenseNumber,
    @Field(ApiKeys.phoneNumber) phoneNumber,
  );
}
