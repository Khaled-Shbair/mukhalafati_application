class DataOfViolation {
  final String date;
  final int price;
  final bool isPaid;
  final String numberOfViolation;
  final String placeOfViolation;
  final String timeOfViolation;
  final String reasonForViolation;

  DataOfViolation({
    required this.date,
    required this.price,
    required this.isPaid,
    required this.numberOfViolation,
    required this.reasonForViolation,
    required this.timeOfViolation,
    required this.placeOfViolation,
  });
}
