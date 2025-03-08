import '/config/all_imports.dart';

class Validator with CustomToast {
  static String? jobNumberValidator(String? number) {
    if (number!.isEmpty) {
      return ManagerStrings.pleaseEnterJobNumber;
    }
    if (number.length != AppConstants.maxLengthOfJobNumber) {
      return ManagerStrings.jobNumberUnAccept;
    }
    return null;
  }

  static String? reasonOfViolationValidator(String? reason) {
    if (reason == null || reason == '') {
      return ManagerStrings.pleaseSelectReasonForViolation;
    }
    return null;
  }

  static String? licenseNumberValidator(String? number) {
    if (number!.isEmpty) {
      return ManagerStrings.pleaseEnterLicenseNumber;
    }
    if (number.length != AppConstants.maxLengthOfLicenseNumber) {
      return ManagerStrings.licenseNumberUnAccept;
    }
    return null;
  }

  static String? vehicleNumberValidator(String? number) {
    if (number!.isEmpty) {
      return ManagerStrings.pleaseEnterVehicleNumber;
    }
    if (number.length < 3) {
      return ManagerStrings.vehicleNumberUnAccept;
    }
    return null;
  }

  static String? vehicleTypeValidator(String? type) {
    if (type!.isEmpty) {
      return ManagerStrings.pleaseEnterVehicleType;
    }
    if (type.length < 3) {
      return ManagerStrings.vehicleTypeUnAccept;
    }
    return null;
  }

  static String? vehicleColorValidator(String? color) {
    if (color!.isEmpty) {
      return ManagerStrings.pleaseEnterVehicleColor;
    }
    if (color.length < 3) {
      return ManagerStrings.vehicleColorUnAccept;
    }
    return null;
  }

  static String? idNumberValidator(String? number) {
    if (number!.isEmpty) {
      return ManagerStrings.pleaseEnterIdNumber;
    }
    if (number.length != AppConstants.maxLengthOfIDNumber) {
      return ManagerStrings.idNumberUnAccept;
    }
    return null;
  }

  static String? fullNameValidator(String? name) {
    if (name!.isEmpty) {
      return ManagerStrings.pleaseEnterFullName;
    }
    if (!name.contains(' ') || name.length < 10) {
      return ManagerStrings.fullNameUnAccept;
    }
    return null;
  }

  static String? dateOfIncidentOrProblemValidator(String? date) {
    if (date!.isEmpty) {
      return ManagerStrings.pleaseEnterDataOfIncidentOrProblem;
    }
    return null;
  }

  static String? addressOfIncidentOrProblemValidator(String? address) {
    if (address!.isEmpty) {
      return ManagerStrings.pleaseEnterAddressOfIncidentOrProblem;
    }
    return null;
  }

  static String? detailsOfComplaintValidator(String? details) {
    if (details!.isEmpty || details.length < 20) {
      return ManagerStrings.pleaseEnterDetailOfComplaint;
    }
    return null;
  }

  static String? passwordValidator(String? password,
      {String? confirmPassword}) {
    if (password == null) {
      return ManagerStrings.pleaseEnterPassword;
    }
    if (password.length < 8) {
      return ManagerStrings.passwordUnAccept;
    }
    if (confirmPassword == null && confirmPassword == password) {
      return ManagerStrings.passwordsNotMatched;
    }
    return null;
  }

  static String? expiryDateCardValidator(String? expiryDate) {
    if (expiryDate!.isEmpty) {
      return ManagerStrings.pleaseEnterExpiryDateCard;
    } else if (expiryDate.length < AppConstants.maxLengthOfExpiryDateCard) {
      return ManagerStrings.expiryDateCardUnAccept;
    } else {
      return null;
    }
  }

  static String? securityCodeValidator(String? securityCode) {
    if (securityCode!.isEmpty) {
      return ManagerStrings.pleaseEnterSecurityCode;
    } else if (securityCode.length != AppConstants.maxLengthOfSecurityCode) {
      return ManagerStrings.securityCodeUnAccept;
    } else {
      return null;
    }
  }

  static String? cardNumberValidator(String? cardNumber) {
    if (cardNumber!.isEmpty) {
      return ManagerStrings.pleaseEnterCardNumber;
    } else if (RegExp(r'^[0-9]{13,19}$').hasMatch(cardNumber)) {
      return ManagerStrings.cardNumberUnAccept;
    } else {
      return null;
    }
  }

  static String? cardHolderNameValidator(String? cardHolderName) {
    if (cardHolderName!.isEmpty) {
      return ManagerStrings.pleaseEnterCardHolderName;
    } else if (cardHolderName.length < AppConstants.maxLengthOfCardNumber) {
      return ManagerStrings.cardHolderNameUnAccept;
    } else {
      return null;
    }
  }

  static String? placeOfViolationValidator(String? place) {
    if (place!.isEmpty) {
      return ManagerStrings.pleaseEnterPlaceOfViolation;
    } else if (place.length < 10) {
      return ManagerStrings.placeOfViolationUnAccept;
    } else {
      return null;
    }
  }
}
