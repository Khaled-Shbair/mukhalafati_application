class FormatNameHelper {
  static String firstNameAndLastNameAr(String name) {
    if (name.isNotEmpty) {
      List<String> result = name.split(' ');
      return '${result.first} ${result.last}';
    } else {
      return '';
    }
  }

  static String firstNameAr(String name) {
    if (name.isNotEmpty) {
      List<String> result = name.split(' ');
      return result.first;
    } else {
      return '';
    }
  }

  static String fullNameEn(String name) {
    if (name.isNotEmpty) {
      List<String> nameEn = name.split(' ');
      return _firstName(nameEn.first) +
          _fatherName(nameEn[1]) +
          _grandFatherName(nameEn[2]) +
          _lastName(nameEn.last);
    } else {
      return '';
    }
  }

  static String _firstName(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  static String _lastName(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  static String _fatherName(String name) {
    return ' ${name[0].toUpperCase()}. ';
  }

  static String _grandFatherName(String name) {
    return '${name[0].toUpperCase()}. ';
  }
}
