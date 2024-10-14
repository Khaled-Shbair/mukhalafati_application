import '/config/all_imports.dart';

class ComplaintModel {
  late int complaintId;
  late int driverId;
  late int stateOfComplaint;
  late String complaintName;
  late String addressOfComplaint;
  late String detailOfComplaint;
  late String dateOfIncidentOrProblem;

  ComplaintModel();

  ComplaintModel.fromMap(Map<String, dynamic> map) {
    complaintId = map[DatabaseConstants.complaintId];
    stateOfComplaint = map[DatabaseConstants.stateOfComplaint];
    complaintName = map[DatabaseConstants.complaintName];
    addressOfComplaint = map[DatabaseConstants.addressOfComplaint];
    detailOfComplaint = map[DatabaseConstants.detailOfComplaint];
    dateOfIncidentOrProblem = map[DatabaseConstants.dateOfIncidentOrProblem];
    driverId = map[DatabaseConstants.driverId];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseConstants.stateOfComplaint: stateOfComplaint,
      DatabaseConstants.complaintName: complaintName,
      DatabaseConstants.addressOfComplaint: addressOfComplaint,
      DatabaseConstants.dateOfIncidentOrProblem: dateOfIncidentOrProblem,
      DatabaseConstants.detailOfComplaint: detailOfComplaint,
      DatabaseConstants.driverId: driverId,
    };
  }
}
