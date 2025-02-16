class AllReasonsOfViolationModel {
  List<ReasonOfViolationModel> data;

  AllReasonsOfViolationModel({
    required this.data,
  });
}

class ReasonOfViolationModel {
  int id;
  double price;
  String reason;

  ReasonOfViolationModel({
    required this.id,
    required this.price,
    required this.reason,
  });
}
