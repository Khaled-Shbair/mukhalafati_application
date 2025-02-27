class AllViolationModel {
  final List<ViolationModel> data;

  AllViolationModel({
    required this.data,
  });
}

class ViolationModel {
  final int id;
  final String driverName;
  final String violationAddress;
  final String violationDate;

  ViolationModel({
    required this.violationDate,
    required this.violationAddress,
    required this.driverName,
    required this.id,
  });
}
