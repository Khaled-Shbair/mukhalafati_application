extension NonNullBool on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullString on String? {
  String noNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}
