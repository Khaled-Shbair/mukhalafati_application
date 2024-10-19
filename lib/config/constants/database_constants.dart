class DatabaseConstants {
  static const String databaseName = 'mukhalafati_database';

  //driver table
  static const String driverTableName = 'driver_table';
  static const String driverId = 'driver_id';
  static const String driverIdNumber = 'driver_id_number';
  static const String driverImage = 'driver_image';
  static const String phone = 'driver_name';
  static const String licenseNumber = 'license_number';
  static const String releaseDate = 'release_date';
  static const String expiryDate = 'expiry_date';
  static const String licenseLevels = 'license_levels';
  static const String driverFirstNameAr = 'driver_first_name_ar';
  static const String driverFirstNameEn = 'driver_first_name_en';
  static const String driverLastNameAr = 'driver_last_name_ar';
  static const String driverLastNameEn = 'driver_last_name_en';
  static const String driverFatherNameAr = 'driver_father_name_ar';
  static const String driverFatherNameEn = 'driver_father_name_en';
  static const String driverGrandFatherNameAr = 'driver_grand_father_name_ar';
  static const String driverGrandFatherNameEn = 'driver_grand_father_name_en';
  static const String driverNameEn = 'driver_name_en';
  static const String driverPassword = 'driver_password';
  static const String numberOfViolationsUnPaid = 'number_of_violations_un_paid';
  static const String numberOfViolationsPaid = 'number_of_violations_paid';
  static const String numberOfUnReadNotifications =
      'number_of_un_read_notifications';

  //complaints table
  static const String complaintsTableName = 'complaints_table_name';
  static const String complaintId = 'complaint_id';
  static const String complaintName = 'complaint_Name';
  static const String dateOfIncidentOrProblem = 'date_of_incident_or_problem';
  static const String addressOfComplaint = 'address_of_complaint';
  static const String detailOfComplaint = 'detail_of_complaint';
  static const String stateOfComplaint = 'state_of_complaint';

  //test result table
  static const String testResultTableName = 'test_result_table_name';
  static const String testID = 'test_id';
  static const String studentName = 'student_name';
  static const String studentId = 'student_id';
  static const String licenseTestResults = 'license_test_results';
  static const String practicalTestResults = 'practical_test_results';

  //violations result table
  static const String violationsTableName = 'violations_table_name';
  static const String violationId = 'violation_id';
  static const String violationDate = 'violation_date';
  static const String priceOfViolation = 'price_of_violation';
  static const String violationState = 'violation_state';
  static const String violationReason = 'violation_reason';
  static const String violationAddress = 'violation_address';
  static const String violationTime = 'violation_time';
  static const String violationPayedBy = 'violation_payed_by';

  //Notifications table
  static const String notificationsTableName = 'notifications_table_name';
  static const String notificationId = 'notification_id';
  static const String notificationText = 'notification_text';
  static const String notificationTime = 'notification_time';

  // Police table
  static const String policeTableName = 'police_table_name';
  static const String policeId = 'police_Id';
  static const String policeFirstNameAr = 'police_first_name_ar';
  static const String policeLastNameAr = 'police_last_name_ar';
  static const String policeFatherNameAr = 'police_father_name_ar';
  static const String policeGrandfatherNameAr = 'police_grand_father_name_ar';
  static const String policeImage = 'police_Image';
  static const String policeJobNumber = 'police_job_number';
  static const String policePassword = 'police_password';
  static const String policePhoneNumber = 'police_phone_number';
  static const String policeMilitaryRank = 'police_military_rank';
}
