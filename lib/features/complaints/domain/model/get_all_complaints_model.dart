class GetAllComplaintsModel {
  List<ComplaintDataModel> data;

  GetAllComplaintsModel({
    required this.data,
  });
}

class ComplaintDataModel {
  final String detailOfComplaint;

  final String dateOfIncidentOrProblem;

  final bool status;

  ComplaintDataModel({
    required this.detailOfComplaint,
    required this.dateOfIncidentOrProblem,
    required this.status,
  });
}
