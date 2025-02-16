class CreateComplaintRequest {
  String? complaintsName;

  String? addressOfComplaint;

  String? detailOfComplaint;

  String? dateOfIncidentOrProblem;

  bool? status;

  int? driverId;

  CreateComplaintRequest({
    required this.driverId,
    required this.addressOfComplaint,
    required this.complaintsName,
    required this.dateOfIncidentOrProblem,
    required this.detailOfComplaint,
    required this.status,
  });
}
