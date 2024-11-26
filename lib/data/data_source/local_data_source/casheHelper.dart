
import 'package:shared_preferences/shared_preferences.dart';


class CashHelper {
  static SharedPreferences? sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveData({
    required String key,
    required dynamic value,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();


    sharedPreferences!.setString(key, value);
  }

  static dynamic getData({
    required String key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(key);

  }

  static Future<bool> removeData({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return await sharedPreferences!.remove(key);
  }

  static Future<bool> removeAllData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return await sharedPreferences!.clear();
  }
}
