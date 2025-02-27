class PoliceManChangePasswordRequest  {
  int? policeManId;
  String? newPassword;
  String? confirmPassword;

  PoliceManChangePasswordRequest({
    required this.policeManId,
    required this.confirmPassword,
    required this.newPassword,
  });
}
