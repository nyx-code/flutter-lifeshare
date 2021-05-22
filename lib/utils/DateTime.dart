import 'package:intl/intl.dart';

extension DateFormExtension on DateTime {
  String get getDateFormat {
    return DateFormat('dd MMM yyy').format(this);
  }
}

extension SucessDateTime on String {
  String get getSuccessDateFormat {
    return DateFormat('dd MMM yyy').format(DateTime.parse(this));
  }
}

extension GetTime on String {
  String get getTimeFormat {
    final str = DateFormat('hh:mm a').format(DateTime.parse(this));
    return str;
  }
}
