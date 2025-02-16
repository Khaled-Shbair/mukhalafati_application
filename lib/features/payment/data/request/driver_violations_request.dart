class DriverViolationsRequest {
  final int driverId;
  final int limit;
  final int page;

  DriverViolationsRequest({
    required this.driverId,
    required this.page,
    required this.limit,
  });
}
