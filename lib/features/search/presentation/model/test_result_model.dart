import '/config/all_imports.dart';

class TestResultModel {
  late int testID;
  late String studentName;
  late String studentId;
  late int licenseTestResults;
  late int practicalTestResults;

  TestResultModel();

  TestResultModel.fromMap(Map<String, dynamic> map) {
    testID = map[DatabaseConstants.testID];
    studentName = map[DatabaseConstants.studentName];
    studentId = map[DatabaseConstants.studentId];
    licenseTestResults = map[DatabaseConstants.licenseTestResults];
    practicalTestResults = map[DatabaseConstants.practicalTestResults];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseConstants.studentName: studentName,
      DatabaseConstants.studentId: studentId,
      DatabaseConstants.licenseTestResults: licenseTestResults,
      DatabaseConstants.practicalTestResults: practicalTestResults,
    };
  }
}
