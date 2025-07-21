import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences ;

  static Future init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key})  {
    init();
    return  sharedPreferences?.get(key);
  }

  static Future<bool?> saveData({required String key, dynamic value}) async {
    init();
    if(value is String) return await sharedPreferences?.setString(key, value);
    if(value is int) return await sharedPreferences?.setInt(key, value);
    if(value is bool) return await sharedPreferences?.setBool(key, value);
    if(value is List<String>) return await sharedPreferences?.setStringList(key, value);
    return await sharedPreferences?.setDouble(key, value);
  }

  static dynamic removeData({required String key}){
    return sharedPreferences?.remove(key);
  }
}