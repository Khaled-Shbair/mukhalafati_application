class ApiConstants {
  static const String baseUrl = 'https://zcknvmsialjyofywmiac.supabase.co';
  static const int sendTimeoutSeconds = 60;
  static const int receiveTimeoutSeconds = 60;
  static const String bearer = 'bearer';
  static const String applicationJson = 'application/json';
  static const String apikey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpja252bXNpYWxqeW9meXdtaWFjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcyOTQxNjMxNywiZXhwIjoyMDQ0OTkyMzE3fQ.sw_U8RZMKxWBsYNPtTpVf1LH4vbBgYkeEG5KR_Rbq_k';
  static const String driverLogin = '$baseUrl/rest/v1/rpc/driver_login';
  static const String policeManLogin = '$baseUrl/rest/v1/rpc/police_login';
}
