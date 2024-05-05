import 'package:shared_preferences/shared_preferences.dart';

// ключ для поля ввода
const STRING_FROM_WHERE = 'STRING_FROM_WHERE';

class StorageService {
  final SharedPreferences _prefs;

  const StorageService(this._prefs);

  String? get stringFromWhere => _prefs.getString(STRING_FROM_WHERE);

  void setStringWhere(String value) => _prefs.setString(STRING_FROM_WHERE, value);

  void removeStringWhere(String value) => _prefs.remove(STRING_FROM_WHERE);
}
