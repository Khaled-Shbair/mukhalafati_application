class GetAllComplaintsRequest {
  int? driverId;
  int? page;
  int? maxLimit;
  String? orderBy;

  GetAllComplaintsRequest({
    required this.driverId,
    required this.page,
    required this.maxLimit,
    required this.orderBy,
  });
}
