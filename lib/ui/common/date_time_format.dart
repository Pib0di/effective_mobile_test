import 'package:intl/intl.dart' show DateFormat;

extension DateTimeFormat on DateTime {
  /// название месяца (краткое)
  ///
  /// ru - 'февр.'
  ///
  /// en - 'Feb'
  String get MMM => DateFormat.MMM('ru').format(this);

  /// день месяца
  String get d => DateFormat.d('ru').format(this);

  /// день недели (краткий)
  ///
  /// ru - 'пт'
  ///
  /// en - 'Fri'
  String get E => DateFormat.E('ru').format(this);

  /// название месяца (полное)
  ///
  /// ru - 'февраль'
  ///
  /// en - 'February'
  String get LLLL => DateFormat.LLLL('ru').format(this);

  /// часы и минуты (24ч формат)
  ///
  /// ru - '13:30'
  ///
  /// en - '13:30'
  String get Hm => DateFormat.Hm('ru').format(this);
}
