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

  void getSaveQwestion() async {
    SharedPreferences defaults = await SharedPreferences.getInstance();
    Map json = jsonDecode(defaults.getString('userData'));
    var user = UserModel.fromJson(json);
  }

  /*
    
    static func removeQwestion(id: Int) {
        let key = EnumKeys.qwestion(value: id).key
        
        ud.removeObject(forKey: key)
    }
    
    static func getsavedQwestion(id: Int) -> Qwestion? {
        let key = EnumKeys.qwestion(value: id).key
        
        if let savedPerson = ud.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Qwestion.self, from: savedPerson) {
                return loadedPerson
            }
        }
        
        return nil
    }
  */

  // save

  // saveIndexSegment(int index) async {
  //   SharedPreferences defaults = await SharedPreferences.getInstance();
  //   defaults.setInt(_EnumKeysDefaults.keySegment.toString(), index);
  // }

  // saveSwitch(bool value) async {
  //   SharedPreferences defaults = await SharedPreferences.getInstance();
  //   defaults.setBool(_EnumKeysDefaults.keySwitch.toString(), value);
  // }

  // saveWord(String wordId, bool isFavorit) async {
  //   SharedPreferences defaults = await SharedPreferences.getInstance();
  //   if (isFavorit == true) {
  //     defaults.setBool(wordId, true);
  //   } else {
  //     defaults.remove(wordId);
  //   }
  // }

  // get

  // Future<int> getSegmentIndex() async {
  //   SharedPreferences defaults = await SharedPreferences.getInstance();
  //   return defaults.getInt(_EnumKeysDefaults.keySegment.toString()) ?? 0;
  // }

  // Future<bool> getSwitchValue() async {
  //   SharedPreferences defaults = await SharedPreferences.getInstance();
  //   return defaults.getBool(_EnumKeysDefaults.keySwitch.toString()) ?? false;
  // }

  // Future<bool> favoritThisWord(String wordId) async {
  //   SharedPreferences defaults = await SharedPreferences.getInstance();
  //   return defaults.getBool(wordId) ?? false;
  // }
}
