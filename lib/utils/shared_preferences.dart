import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static late SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    return _prefsInstance = await SharedPreferences.getInstance();
  }

  static Future<bool> setId(String id) async {
    return await _prefsInstance.setString('id', id);
  }

  static String? getId() {
    return _prefsInstance.getString('id');
  }

  static Future<bool> setAccessToken(String accessToken) async {
    return await _prefsInstance.setString('accessToken', accessToken);
  }

  static String? getAccessToken() {
    return _prefsInstance.getString('accessToken');
  }

  static Future<bool> clearStorage() async {
    return await _prefsInstance.clear();
  }
}
