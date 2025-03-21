import '/config/all_imports.dart';

extension NonNullBool on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullList on List? {
  List onNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullNum on num? {
  num onNull() {
    if (this == null) {
      return 0;
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

extension Navigators on BuildContext {
  pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  pushNamedAndRemoveAllUntil(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  popAndPushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);
  }

  pop<T extends Object?>([T? result]) => Navigator.of(this).pop();
}
