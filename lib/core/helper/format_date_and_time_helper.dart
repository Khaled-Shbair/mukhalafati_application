class FormatDateAndTimeHelper {
  static final DateTime _dateTime = DateTime.now();

  static String get currentMonth => _dateTime.month.toString();

  // List of days of the week in Arabic
  static const List<String> _daysInArabic = [
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد'
  ];

  // weekday: Returns the day of the week number. Start form (Monday)
  static String get currentDay => _daysInArabic[_dateTime.weekday - 1];

  static String get dateNow =>
      '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';

  static String get timeNow {
    if (_dateTime.hour >= 12) {
      return 'PM $_formatHour:${_dateTime.minute}:${_dateTime.second}';
    } else {
      return 'AM $_formatHour:${_dateTime.minute}:${_dateTime.second}';
    }
  }

  static int get _formatHour {
    switch (_dateTime.hour) {
      case (1 || 13):
        return 1;
      case (2 || 14):
        return 2;
      case (3 || 15):
        return 3;
      case (4 || 16):
        return 4;
      case (5 || 17):
        return 5;
      case (6 || 18):
        return 6;
      case (7 || 19):
        return 7;
      case (8 || 20):
        return 8;
      case (9 || 21):
        return 9;
      case (10 || 22):
        return 10;
      case (11 || 23):
        return 11;
      case (12 || 24):
        return 12;
      default:
        return _dateTime.hour;
    }
  }
}
