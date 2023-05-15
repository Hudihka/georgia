import 'package:georgia/Model/qwestion.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserDefaults {
  UserDefaults._();
  static final UserDefaults shared = UserDefaults._();

  String _generateKey(int id) {
    return "qwestion_id_$id";
  }

  String _generateKeyQwestion(Qwestion qwestion) {
    return _generateKey(qwestion.idQwestion);
  }

  void saveQwestion(Qwestion qwestion) async {
    String key = _generateKeyQwestion(qwestion);

    SharedPreferences defaults = await SharedPreferences.getInstance();

    String userData = jsonEncode(qwestion);
    defaults.setString(key, userData);
  }

  Future<Qwestion?> getSaveQwestion(int id) async {
    String key = _generateKey(id);

    SharedPreferences defaults = await SharedPreferences.getInstance();
    String? str = defaults.getString(key);

    if (str == null) {
      return null;
    }

    Map<String, dynamic> json = jsonDecode(str);

    return Qwestion.fromJson(json);
  }

  void removeQwestion(int id) async {
    String key = _generateKey(id);

    SharedPreferences defaults = await SharedPreferences.getInstance();

    defaults.remove(key);
  }
}
