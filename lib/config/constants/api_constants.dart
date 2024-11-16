class ApiConstants {
  static const String baseUrl = 'https://zcknvmsialjyofywmiac.supabase.co';
  static const int sendTimeoutSeconds = 60;
  static const int receiveTimeoutSeconds = 60;
  static const String bearer = 'bearer';
  static const String applicationJson = 'application/json';
  static const String apikey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpja252bXNpYWxqeW9meXdtaWFjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcyOTQxNjMxNywiZXhwIjoyMDQ0OTkyMzE3fQ.sw_U8RZMKxWBsYNPtTpVf1LH4vbBgYkeEG5KR_Rbq_k';
  static const String driverLogin = '$baseUrl/rest/v1/rpc/driver_login';
  static const String policeManLogin = '$baseUrl/rest/v1/rpc/police_man_login';
  static const String createComplaint = '$baseUrl/rest/v1/rpc/create_complaint';
  static const String forgetPasswordDriver =
      '$baseUrl/rest/v1/rpc/forget_password_driver';
  static const String forgetPasswordPoliceMan =
      '$baseUrl/rest/v1/rpc/forget_password_police_man';
  static const String changePasswordDriver =
      '$baseUrl/rest/v1/rpc/driver_change_password';
  static const String changePasswordPoliceMan =
      '$baseUrl/rest/v1/rpc/police_man_change_password';
  static const String getAllComplaintsForDriver =
      '$baseUrl/rest/v1/rpc/get_all_complaints_for_driver';
  static const String searchForDriver =
      '$baseUrl/rest/v1/rpc/search_for_driver';
  static const String searchOnResultsTestsOfLicense =
      '$baseUrl/rest/v1/rpc/search_on_results_tests_of_license';
  static const String createViolation = '$baseUrl/rest/v1/rpc/create_violation';
  static const String reasonOfViolation =
      '$baseUrl/rest/v1/rpc/reason_of_violation';
  static const String paymentViolation =
      '$baseUrl/rest/v1/rpc/payment_violation';
  static const String listOfReasonsOfViolations =
      '$baseUrl/rest/v1/rpc/list_of_reasons_of_violations';
  static const String getDriverViolations =
      '$baseUrl/rest/v1/rpc/get_driver_violations';
}
